# Solución para el error `cloud_firestore/permission-denied`

## Problema identificado

El error `cloud_firestore/permission-denied` puede venir de dos fuentes:

### 1. Firebase Storage (MÁS PROBABLE)
Las reglas de Storage estaban bloqueando todas las operaciones excepto `users/{userId}/**`, pero la aplicación sube archivos a otras rutas como:
- `imagenesReportePortada/`
- `reportesReportePDF/`
- `imagenesHabitantePortada/`
- `audiosAudioHabitante/`
- `imagenesProcesoImagenes/`
- `imagenesTendenciasPortada/`
- `imagenesSenales/`
- `imagenesEscenarios/`
- `audiosHabitantes/`
- `imagenesHabitantes/`
- `imagenesManifestaciones/`
- `imagenesIniciativas/`

**✅ SOLUCIONADO:** Las reglas de Storage ya fueron actualizadas en `firebase/storage.rules` para permitir estas rutas.

### 2. Firestore
Las reglas de Firestore parecen estar correctas, pero verifica que permitan todas las operaciones necesarias.

## Pasos para desplegar las nuevas reglas

### Opción 1: Desde la consola de Firebase
1. Ve a https://console.firebase.google.com/
2. Selecciona tu proyecto
3. Ve a **Storage** > **Rules**
4. Copia y pega el contenido de `firebase/storage.rules`
5. Haz clic en **Publicar**

### Opción 2: Usando Firebase CLI
```bash
# Si tienes Firebase CLI instalado
firebase deploy --only storage:rules

# Si no lo tienes instalado, primero instálalo:
npm install -g firebase-tools
firebase login
firebase deploy --only storage:rules
```

### Opción 3: Desde el directorio firebase/
Si tienes Firebase CLI instalado y configurado:
```bash
cd firebase
firebase deploy --only storage:rules
```

## Verificación

Después de desplegar las reglas, prueba:
1. Subir una imagen en el formulario de reporte
2. Guardar un reporte completo
3. Verificar que no aparezcan más errores de permisos

## Nota importante

Las reglas actuales permiten acceso completo (`if true`) a todas las rutas mencionadas. Si necesitas más seguridad en producción, considera:
- Agregar validación de autenticación: `if request.auth != null`
- Validar tipos de archivo
- Limitar tamaños de archivo

