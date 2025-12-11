import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:typed_data';
import 'formulario_escenarios_model.dart';
export 'formulario_escenarios_model.dart';

// Formatter para capitalizar la primera letra de cada oración
class SentenceCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    String text = newValue.text;
    
    // Si es el primer carácter, capitalizarlo
    if (oldValue.text.isEmpty && text.isNotEmpty) {
      text = text[0].toUpperCase() + text.substring(1);
    }
    
    // Capitalizar después de punto y espacio
    text = text.replaceAllMapped(
      RegExp(r'(\.\s+)([a-z])'),
      (match) => match.group(1)! + match.group(2)!.toUpperCase(),
    );
    
    // Capitalizar al inicio del texto
    if (text.isNotEmpty && text[0].toLowerCase() == text[0]) {
      text = text[0].toUpperCase() + text.substring(1);
    }

    return TextEditingValue(
      text: text,
      selection: newValue.selection,
    );
  }
}

class FormularioEscenariosWidget extends StatefulWidget {
  const FormularioEscenariosWidget({super.key});

  @override
  State<FormularioEscenariosWidget> createState() =>
      _FormularioEscenariosWidgetState();
}

class _FormularioEscenariosWidgetState extends State<FormularioEscenariosWidget> {
  late FormularioEscenariosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormularioEscenariosModel());

    _model.switchValue1 = true;
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      safeSetState(() {});
      // Inicializar carga de tendencias después del primer frame
      final tendenciasDisponibles = _model.getTendenciasDisponibles?.call() ?? [];
      if (tendenciasDisponibles.isNotEmpty && _model.tendenciasCachedData == null && !_model.isLoadingTendencias) {
        _model.initializeTendencias();
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  InputDecoration _buildInputDecoration(String label, {String? hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Colors.white70,
      ),
      hintStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.white54,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white24, width: 1.5),
        borderRadius: BorderRadius.circular(16.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(16.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFEF4444), width: 1.5),
        borderRadius: BorderRadius.circular(16.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFEF4444), width: 2.0),
        borderRadius: BorderRadius.circular(16.0),
      ),
      filled: true,
      fillColor: Colors.white.withOpacity(0.05),
      contentPadding: const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 16.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 800.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 20.0, 24.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header con título y switch
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Escenarios',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 28.0,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _model.switchValue1 == true ? 'Habilitado' : 'Deshabilitado',
                      style: GoogleFonts.inter(
                        color: _model.switchValue1 == true
                            ? const Color(0xFF10B981)
                            : const Color(0xFFEF4444),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Switch.adaptive(
                      value: _model.switchValue1!,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.switchValue1 = newValue);
                      },
                      activeColor: const Color(0xFF0F092C),
                      activeTrackColor: const Color(0xFF10B981),
                      inactiveTrackColor: Colors.white24,
                      inactiveThumbColor: Colors.white70,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Campo título de sección
            TextFormField(
              controller: _model.textController1,
              focusNode: _model.textFieldFocusNode1,
              decoration: _buildInputDecoration('Título de sección'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [SentenceCaseFormatter()],
              cursorColor: Colors.white,
              validator: _model.textController1Validator.asValidator(context),
            ),
            const SizedBox(height: 16),

            // Campo subtítulo de sección
            TextFormField(
              controller: _model.textController2,
              focusNode: _model.textFieldFocusNode2,
              decoration: _buildInputDecoration('Subtítulo de sección'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 6,
              minLines: 4,
              maxLength: 156,
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [SentenceCaseFormatter()],
              cursorColor: Colors.white,
              buildCounter: (context,
                  {required currentLength,
                  required isFocused,
                  maxLength}) {
                return Text(
                  '$currentLength / $maxLength',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.white60,
                  ),
                );
              },
              validator: _model.textController2Validator.asValidator(context),
            ),
            const SizedBox(height: 24),

            // Lista de formularios de escenarios
            if (_model.escenariosForms.isNotEmpty)
              Column(
                children: _model.escenariosForms.asMap().entries.map((entry) {
                  final index = entry.key;
                  final escenarioForm = entry.value;
                  return _buildEscenarioForm(index, escenarioForm);
                }).toList(),
              ),

            const SizedBox(height: 16),

            // Botón para agregar nuevo escenario
            if (_model.escenariosForms.length < 5)
              InkWell(
                onTap: () {
                  safeSetState(() {
                    _model.addEscenarioForm();
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 28.0,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Agregar Escenario',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEscenarioForm(int index, EscenarioFormData escenarioForm) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header del formulario con número y botón eliminar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Escenario ${index + 1}',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      safeSetState(() {
                        _model.removeEscenarioForm(index);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEF4444).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.delete_outline,
                        color: Color(0xFFEF4444),
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Campos básicos
            TextFormField(
              controller: escenarioForm.tituloController,
              focusNode: escenarioForm.tituloFocusNode,
              decoration: _buildInputDecoration('Título'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [SentenceCaseFormatter()],
              cursorColor: Colors.white,
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: escenarioForm.subtituloController,
              focusNode: escenarioForm.subtituloFocusNode,
              decoration: _buildInputDecoration('Subtítulo'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              maxLength: 128,
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [SentenceCaseFormatter()],
              cursorColor: Colors.white,
              buildCounter: (context,
                  {required currentLength,
                  required isFocused,
                  maxLength}) {
                return Text(
                  '$currentLength / $maxLength',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.white60,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: escenarioForm.descripcionController,
              focusNode: escenarioForm.descripcionFocusNode,
              decoration: _buildInputDecoration('Descripción'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 4,
              minLines: 3,
              maxLength: 305,
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [SentenceCaseFormatter()],
              cursorColor: Colors.white,
              buildCounter: (context,
                  {required currentLength,
                  required isFocused,
                  maxLength}) {
                return Text(
                  '$currentLength / $maxLength',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.white60,
                  ),
                );
              },
            ),
            const SizedBox(height: 24),

            // Sección Tendencias que la originan
            _buildTendenciasOriginaSection(index, escenarioForm),
            const SizedBox(height: 24),

            // Imagen principal
            _buildImagenPrincipalSection(index, escenarioForm),
            const SizedBox(height: 24),

            // Sección Habitantes
            _buildHabitantesSection(index, escenarioForm),
            const SizedBox(height: 24),

            // Sección Cards
            _buildCardsSection(index, escenarioForm),
            const SizedBox(height: 24),

            // Sección Manifestaciones
            _buildManifestacionesSection(index, escenarioForm),
            const SizedBox(height: 24),

            // Sección Iniciativas
            _buildIniciativasSection(index, escenarioForm),
          ],
        ),
      ),
    );
  }

  Widget _buildTendenciasOriginaSection(int index, EscenarioFormData escenarioForm) {
    // Obtener tendencias disponibles (DocumentReferences)
    final tendenciasDisponibles = _model.getTendenciasDisponibles?.call() ?? [];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Tendencias que la originan',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '(máximo 3)',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.white54,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        
        if (tendenciasDisponibles.isEmpty)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white24, width: 1),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: Colors.white54, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'No hay tendencias disponibles. Crea tendencias primero.',
                    style: GoogleFonts.inter(
                      color: Colors.white54,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          )
        else if (_model.tendenciasCachedData == null || _model.isLoadingTendencias)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          )
        else if (_model.tendenciasCachedData != null && _model.tendenciasCachedData!.isEmpty)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white24, width: 1),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: Colors.white54, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'No hay tendencias disponibles.',
                    style: GoogleFonts.inter(
                      color: Colors.white54,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          )
        else
          Column(
            children: (_model.tendenciasCachedData ?? []).map((tendenciaRecord) {
                  final tendenciaData = tendenciaRecord.tendencias;
                  final isSelected = escenarioForm.tendenciasOrigina.any(
                    (ref) => ref.path == tendenciaRecord.reference.path
                  );
                  final canSelect = escenarioForm.tendenciasOrigina.length < 3 || isSelected;
                  
                  // Obtener el título, verificando si el struct tiene datos
                  String titulo;
                  if (tendenciaData.hasTitulo() && tendenciaData.titulo.isNotEmpty) {
                    titulo = tendenciaData.titulo;
                  } else {
                    // Si no hay título, mostrar ID del documento
                    titulo = 'Tendencia (ID: ${tendenciaRecord.reference.id})';
                  }
                  
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected 
                            ? Colors.white.withOpacity(0.4) 
                            : Colors.white24, 
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: canSelect ? () {
                          safeSetState(() {
                            final newTendenciasOrigina = List<DocumentReference>.from(escenarioForm.tendenciasOrigina);
                            if (isSelected) {
                              newTendenciasOrigina.removeWhere(
                                (ref) => ref.path == tendenciaRecord.reference.path
                              );
                            } else {
                              if (newTendenciasOrigina.length < 3) {
                                newTendenciasOrigina.add(tendenciaRecord.reference);
                              }
                            }
                            _model.updateEscenarioForm(
                              index,
                              (form) => EscenarioFormData(
                                tituloController: form.tituloController,
                                tituloFocusNode: form.tituloFocusNode,
                                subtituloController: form.subtituloController,
                                subtituloFocusNode: form.subtituloFocusNode,
                                descripcionController: form.descripcionController,
                                descripcionFocusNode: form.descripcionFocusNode,
                                uploadedImagenPrincipal: form.uploadedImagenPrincipal,
                                imagenPrincipalUrl: form.imagenPrincipalUrl,
                                isUploadingImagenPrincipal: form.isUploadingImagenPrincipal,
                                imagenSecundariasUrls: form.imagenSecundariasUrls,
                                uploadedImagenesSecundarias: form.uploadedImagenesSecundarias,
                                habitantesForms: form.habitantesForms,
                                cardsForms: form.cardsForms,
                                manifestacionesForms: form.manifestacionesForms,
                                iniciativasForms: form.iniciativasForms,
                                tendenciasOrigina: newTendenciasOrigina,
                              ),
                            );
                          });
                        } : null,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected ? Colors.white : Colors.white54,
                                    width: 2,
                                  ),
                                  color: isSelected 
                                      ? Colors.white 
                                      : Colors.transparent,
                                ),
                                child: isSelected
                                    ? const Icon(
                                        Icons.check,
                                        size: 16,
                                        color: Color(0xFF0F092C),
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  titulo,
                                  style: GoogleFonts.inter(
                                    color: canSelect ? Colors.white : Colors.white38,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              if (!canSelect && !isSelected)
                                const Icon(
                                  Icons.lock_outline,
                                  color: Colors.white38,
                                  size: 20,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        
        const SizedBox(height: 8),
        Text(
          '${escenarioForm.tendenciasOrigina.length} de 3 seleccionadas',
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.white60,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildImagenPrincipalSection(int index, EscenarioFormData escenarioForm) {
    final hasImage = escenarioForm.uploadedImagenPrincipal?.bytes != null &&
        escenarioForm.uploadedImagenPrincipal!.bytes!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Imagen Principal',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        if (hasImage) ...[
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.memory(
                    escenarioForm.uploadedImagenPrincipal!.bytes!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.white12,
                        child: const Center(
                          child: Icon(Icons.broken_image,
                              color: Colors.white54, size: 48),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Material(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          safeSetState(() {
                            _model.updateEscenarioForm(
                              index,
                              (form) => EscenarioFormData(
                                tituloController: form.tituloController,
                                tituloFocusNode: form.tituloFocusNode,
                                subtituloController: form.subtituloController,
                                subtituloFocusNode: form.subtituloFocusNode,
                                descripcionController: form.descripcionController,
                                descripcionFocusNode: form.descripcionFocusNode,
                                uploadedImagenPrincipal: FFUploadedFile(
                                    bytes: Uint8List.fromList([]),
                                    originalFilename: ''),
                                imagenPrincipalUrl: '',
                                isUploadingImagenPrincipal: false,
                                imagenSecundariasUrls: form.imagenSecundariasUrls,
                                uploadedImagenesSecundarias: form.uploadedImagenesSecundarias,
                                habitantesForms: form.habitantesForms,
                                cardsForms: form.cardsForms,
                                manifestacionesForms: form.manifestacionesForms,
                                iniciativasForms: form.iniciativasForms,
                              ),
                            );
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.close, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
        InkWell(
          onTap: () async {
            final selectedMedia = await selectMedia(
              mediaSource: MediaSource.photoGallery,
              multiImage: false,
            );
            if (selectedMedia != null &&
                selectedMedia.every((m) =>
                    validateFileFormat(m.storagePath, context))) {
              // Guardar solo localmente para preview
              var selectedUploadedFiles = selectedMedia
                  .map((m) => FFUploadedFile(
                        name: m.storagePath.split('/').last,
                        bytes: m.bytes,
                        height: m.dimensions?.height,
                        width: m.dimensions?.width,
                        blurHash: m.blurHash,
                        originalFilename: m.originalFilename,
                      ))
                  .toList();

              safeSetState(() {
                _model.updateEscenarioForm(
                  index,
                  (form) => EscenarioFormData(
                    tituloController: form.tituloController,
                    tituloFocusNode: form.tituloFocusNode,
                    subtituloController: form.subtituloController,
                    subtituloFocusNode: form.subtituloFocusNode,
                    descripcionController: form.descripcionController,
                    descripcionFocusNode: form.descripcionFocusNode,
                    uploadedImagenPrincipal: selectedUploadedFiles.isNotEmpty
                        ? selectedUploadedFiles.first
                        : form.uploadedImagenPrincipal,
                    imagenPrincipalUrl: '', // Se subirá al guardar
                    isUploadingImagenPrincipal: false,
                    imagenSecundariasUrls: form.imagenSecundariasUrls,
                    uploadedImagenesSecundarias: form.uploadedImagenesSecundarias,
                    habitantesForms: form.habitantesForms,
                    cardsForms: form.cardsForms,
                    manifestacionesForms: form.manifestacionesForms,
                    iniciativasForms: form.iniciativasForms,
                  ),
                );
              });
            }
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: hasImage
                  ? Colors.white.withOpacity(0.05)
                  : Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  hasImage ? Icons.image : Icons.add_photo_alternate_rounded,
                  color: Colors.white,
                  size: 28.0,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    hasImage ? 'Cambiar imagen principal' : 'Subir imagen principal',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (escenarioForm.isUploadingImagenPrincipal)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildHabitantesSection(int index, EscenarioFormData escenarioForm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Habitantes',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () {
                safeSetState(() {
                  _model.addHabitanteForm(index);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF6F61EF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Agregar',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (escenarioForm.habitantesForms.isNotEmpty)
          Column(
            children: escenarioForm.habitantesForms.asMap().entries.map((entry) {
              final habitanteIndex = entry.key;
              final habitanteForm = entry.value;
              return _buildHabitanteForm(index, habitanteIndex, habitanteForm);
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildHabitanteForm(int escenarioIndex, int habitanteIndex, EscenarioHabitanteFormData habitanteForm) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Habitante ${habitanteIndex + 1}',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                    color: Colors.white70,
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      safeSetState(() {
                        _model.removeHabitanteForm(escenarioIndex, habitanteIndex);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEF4444).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.delete_outline,
                        color: Color(0xFFEF4444),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: habitanteForm.nombreController,
              focusNode: habitanteForm.nombreFocusNode,
              decoration: _buildInputDecoration('Nombre (número)'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              keyboardType: TextInputType.number,
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [SentenceCaseFormatter()],
              cursorColor: Colors.white,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: habitanteForm.descripcionController,
              focusNode: habitanteForm.descripcionFocusNode,
              decoration: _buildInputDecoration('Descripción'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 4,
              minLines: 3,
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [SentenceCaseFormatter()],
              cursorColor: Colors.white,
            ),
            const SizedBox(height: 12),
            _buildFileUploadSection(
              'Imagen',
              habitanteForm.uploadedImage,
              habitanteForm.isUploadingImage,
              (files, urls) {
                _model.updateHabitanteForm(
                  escenarioIndex,
                  habitanteIndex,
                  (form) => EscenarioHabitanteFormData(
                    audioController: form.audioController,
                    audioFocusNode: form.audioFocusNode,
                    imagenController: form.imagenController,
                    imagenFocusNode: form.imagenFocusNode,
                    nombreController: form.nombreController,
                    nombreFocusNode: form.nombreFocusNode,
                    descripcionController: form.descripcionController,
                    descripcionFocusNode: form.descripcionFocusNode,
                    uploadedImage: files.isNotEmpty ? files.first : null,
                    imageUrl: urls.isNotEmpty ? urls.first : null,
                    isUploadingImage: false,
                    uploadedAudio: form.uploadedAudio,
                    audioUrl: form.audioUrl,
                    isUploadingAudio: form.isUploadingAudio,
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildFileUploadSection(
              'Audio',
              habitanteForm.uploadedAudio,
              habitanteForm.isUploadingAudio,
              (files, urls) {
                _model.updateHabitanteForm(
                  escenarioIndex,
                  habitanteIndex,
                  (form) => EscenarioHabitanteFormData(
                    audioController: form.audioController,
                    audioFocusNode: form.audioFocusNode,
                    imagenController: form.imagenController,
                    imagenFocusNode: form.imagenFocusNode,
                    nombreController: form.nombreController,
                    nombreFocusNode: form.nombreFocusNode,
                    descripcionController: form.descripcionController,
                    descripcionFocusNode: form.descripcionFocusNode,
                    uploadedAudio: files.isNotEmpty ? files.first : null,
                    audioUrl: urls.isNotEmpty ? urls.first : null,
                    isUploadingAudio: false,
                    uploadedImage: form.uploadedImage,
                    imageUrl: form.imageUrl,
                    isUploadingImage: form.isUploadingImage,
                  ),
                );
              },
              isAudio: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardsSection(int index, EscenarioFormData escenarioForm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cards',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () {
                safeSetState(() {
                  _model.addCardForm(index);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF6F61EF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Agregar',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (escenarioForm.cardsForms.isNotEmpty)
          Column(
            children: escenarioForm.cardsForms.asMap().entries.map((entry) {
              final cardIndex = entry.key;
              final cardForm = entry.value;
              return _buildCardForm(index, cardIndex, cardForm);
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildCardForm(int escenarioIndex, int cardIndex, EscenarioCardFormData cardForm) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Card ${cardIndex + 1}',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                    color: Colors.white70,
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      safeSetState(() {
                        _model.removeCardForm(escenarioIndex, cardIndex);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEF4444).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.delete_outline,
                        color: Color(0xFFEF4444),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: cardForm.tituloController,
              focusNode: cardForm.tituloFocusNode,
              decoration: _buildInputDecoration('Título'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [SentenceCaseFormatter()],
              cursorColor: Colors.white,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: cardForm.descripcionController,
              focusNode: cardForm.descripcionFocusNode,
              decoration: _buildInputDecoration('Descripción'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 4,
              minLines: 3,
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [SentenceCaseFormatter()],
              cursorColor: Colors.white,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: cardForm.fuenteController,
              focusNode: cardForm.fuenteFocusNode,
              decoration: _buildInputDecoration('Fuente'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [SentenceCaseFormatter()],
              cursorColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildManifestacionesSection(int index, EscenarioFormData escenarioForm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Manifestaciones',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () {
                safeSetState(() {
                  _model.addManifestacionForm(index);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF6F61EF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Agregar',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (escenarioForm.manifestacionesForms.isNotEmpty)
          Column(
            children: escenarioForm.manifestacionesForms.asMap().entries.map((entry) {
              final manifestacionIndex = entry.key;
              final manifestacionForm = entry.value;
              return _buildManifestacionForm(index, manifestacionIndex, manifestacionForm);
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildManifestacionForm(int escenarioIndex, int manifestacionIndex, EscenarioManifestacionFormData manifestacionForm) {
    final hasImage = manifestacionForm.uploadedImage?.bytes != null &&
        manifestacionForm.uploadedImage!.bytes!.isNotEmpty;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Manifestación ${manifestacionIndex + 1}',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                    color: Colors.white70,
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      safeSetState(() {
                        _model.removeManifestacionForm(escenarioIndex, manifestacionIndex);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEF4444).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.delete_outline,
                        color: Color(0xFFEF4444),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildImageUploadSectionForManifestacion(escenarioIndex, manifestacionIndex, manifestacionForm, hasImage),
            const SizedBox(height: 12),
            TextFormField(
              controller: manifestacionForm.tituloController,
              focusNode: manifestacionForm.tituloFocusNode,
              decoration: _buildInputDecoration('Título'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [SentenceCaseFormatter()],
              cursorColor: Colors.white,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: manifestacionForm.descripcionController,
              focusNode: manifestacionForm.descripcionFocusNode,
              decoration: _buildInputDecoration('Descripción'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 4,
              minLines: 3,
              maxLength: 284,
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [SentenceCaseFormatter()],
              cursorColor: Colors.white,
              buildCounter: (context,
                  {required currentLength,
                  required isFocused,
                  maxLength}) {
                return Text(
                  '$currentLength / $maxLength',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.white60,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIniciativasSection(int index, EscenarioFormData escenarioForm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Iniciativas',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () {
                safeSetState(() {
                  _model.addIniciativaForm(index);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF6F61EF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Agregar',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (escenarioForm.iniciativasForms.isNotEmpty)
          Column(
            children: escenarioForm.iniciativasForms.asMap().entries.map((entry) {
              final iniciativaIndex = entry.key;
              final iniciativaForm = entry.value;
              return _buildIniciativaForm(index, iniciativaIndex, iniciativaForm);
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildIniciativaForm(int escenarioIndex, int iniciativaIndex, EscenarioIniciativaFormData iniciativaForm) {
    final hasImage = iniciativaForm.uploadedImage?.bytes != null &&
        iniciativaForm.uploadedImage!.bytes!.isNotEmpty;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Iniciativa ${iniciativaIndex + 1}',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                    color: Colors.white70,
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      safeSetState(() {
                        _model.removeIniciativaForm(escenarioIndex, iniciativaIndex);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEF4444).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.delete_outline,
                        color: Color(0xFFEF4444),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: iniciativaForm.tituloController,
              focusNode: iniciativaForm.tituloFocusNode,
              decoration: _buildInputDecoration('Título'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [SentenceCaseFormatter()],
              cursorColor: Colors.white,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: iniciativaForm.descripcionController,
              focusNode: iniciativaForm.descripcionFocusNode,
              decoration: _buildInputDecoration('Descripción'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 4,
              minLines: 3,
              maxLength: 157,
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [SentenceCaseFormatter()],
              cursorColor: Colors.white,
              buildCounter: (context,
                  {required currentLength,
                  required isFocused,
                  maxLength}) {
                return Text(
                  '$currentLength / $maxLength',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.white60,
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            // Sección de Capacidades
            Text(
              'Capacidades',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            
            // Lista de formularios de capacidades
            if (iniciativaForm.capacidadesForms.isNotEmpty)
              Column(
                children: iniciativaForm.capacidadesForms.asMap().entries.map((entry) {
                  final capacidadIndex = entry.key;
                  final capacidadForm = entry.value;
                  return _buildCapacidadForm(escenarioIndex, iniciativaIndex, capacidadIndex, capacidadForm);
                }).toList(),
              ),

            const SizedBox(height: 16),

            // Botón para agregar nueva capacidad
            InkWell(
              onTap: () {
                safeSetState(() {
                  _model.addCapacidadForm(escenarioIndex, iniciativaIndex);
                });
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                      size: 28.0,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Agregar Capacidad',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildImageUploadSectionForIniciativa(escenarioIndex, iniciativaIndex, iniciativaForm, hasImage),
          ],
        ),
      ),
    );
  }

  Widget _buildCapacidadForm(int escenarioIndex, int iniciativaIndex, int capacidadIndex, CapacidadFormData capacidadForm) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Capacidad ${capacidadIndex + 1}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    safeSetState(() {
                      _model.removeCapacidadForm(escenarioIndex, iniciativaIndex, capacidadIndex);
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEF4444).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.delete_outline,
                      color: Color(0xFFEF4444),
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: capacidadForm.textoController,
            focusNode: capacidadForm.textoFocusNode,
            decoration: _buildInputDecoration('Descripción de la capacidad'),
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 4,
            minLines: 2,
            textCapitalization: TextCapitalization.sentences,
            inputFormatters: [SentenceCaseFormatter()],
            cursorColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildFileUploadSection(
    String label,
    FFUploadedFile? uploadedFile,
    bool isUploading,
    Function(List<FFUploadedFile>, List<String>) onUploadComplete, {
    bool isAudio = false,
  }) {
    final hasFile = uploadedFile?.bytes != null && uploadedFile!.bytes!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () async {
            final selectedMedia = await selectFiles(
              allowedExtensions: isAudio ? ['mp3', 'wav', 'm4a'] : ['jpg', 'jpeg', 'png', 'gif'],
              multiFile: false,
            );
            if (selectedMedia != null && selectedMedia.isNotEmpty) {
              final media = selectedMedia.first;
              
              // Guardar solo localmente para preview
              safeSetState(() {
                onUploadComplete(
                  [FFUploadedFile(
                    name: media.storagePath.split('/').last,
                    bytes: media.bytes,
                    height: media.dimensions?.height,
                    width: media.dimensions?.width,
                    blurHash: media.blurHash,
                    originalFilename: media.originalFilename,
                  )],
                  [''], // URL vacío, se subirá al guardar
                );
              });
            }
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: hasFile
                  ? Colors.white.withOpacity(0.05)
                  : Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  hasFile
                      ? (isAudio ? Icons.audiotrack : Icons.image)
                      : (isAudio ? Icons.audiotrack : Icons.add_photo_alternate_rounded),
                  color: Colors.white,
                  size: 28.0,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    hasFile
                        ? (isAudio ? 'Cambiar audio' : 'Cambiar imagen')
                        : (isAudio ? 'Subir audio' : 'Subir imagen'),
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageUploadSectionForManifestacion(
    int escenarioIndex,
    int manifestacionIndex,
    EscenarioManifestacionFormData manifestacionForm,
    bool hasImage,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasImage) ...[
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.memory(
                    manifestacionForm.uploadedImage!.bytes!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.white12,
                        child: const Center(
                          child: Icon(Icons.broken_image,
                              color: Colors.white54, size: 48),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Material(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          safeSetState(() {
                            _model.updateManifestacionForm(
                              escenarioIndex,
                              manifestacionIndex,
                              (form) => EscenarioManifestacionFormData(
                                imagenController: form.imagenController,
                                imagenFocusNode: form.imagenFocusNode,
                                tituloController: form.tituloController,
                                tituloFocusNode: form.tituloFocusNode,
                                descripcionController: form.descripcionController,
                                descripcionFocusNode: form.descripcionFocusNode,
                                uploadedImage: FFUploadedFile(
                                    bytes: Uint8List.fromList([]),
                                    originalFilename: ''),
                                imageUrl: '',
                                isUploadingImage: false,
                              ),
                            );
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.close, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
        InkWell(
          onTap: () async {
            final selectedMedia = await selectMedia(
              mediaSource: MediaSource.photoGallery,
              multiImage: false,
            );
            if (selectedMedia != null &&
                selectedMedia.every((m) =>
                    validateFileFormat(m.storagePath, context))) {
              // Guardar solo localmente para preview
              var selectedUploadedFiles = selectedMedia
                  .map((m) => FFUploadedFile(
                        name: m.storagePath.split('/').last,
                        bytes: m.bytes,
                        height: m.dimensions?.height,
                        width: m.dimensions?.width,
                        blurHash: m.blurHash,
                        originalFilename: m.originalFilename,
                      ))
                  .toList();

              safeSetState(() {
                _model.updateManifestacionForm(
                  escenarioIndex,
                  manifestacionIndex,
                  (form) => EscenarioManifestacionFormData(
                    imagenController: form.imagenController,
                    imagenFocusNode: form.imagenFocusNode,
                    tituloController: form.tituloController,
                    tituloFocusNode: form.tituloFocusNode,
                    descripcionController: form.descripcionController,
                    descripcionFocusNode: form.descripcionFocusNode,
                    uploadedImage: selectedUploadedFiles.isNotEmpty
                        ? selectedUploadedFiles.first
                        : form.uploadedImage,
                    imageUrl: '', // Se subirá al guardar
                    isUploadingImage: false,
                  ),
                );
              });
            }
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: hasImage
                  ? Colors.white.withOpacity(0.05)
                  : Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  hasImage ? Icons.image : Icons.add_photo_alternate_rounded,
                  color: Colors.white,
                  size: 28.0,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    hasImage ? 'Cambiar imagen' : 'Subir imagen',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (manifestacionForm.isUploadingImage)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageUploadSectionForIniciativa(
    int escenarioIndex,
    int iniciativaIndex,
    EscenarioIniciativaFormData iniciativaForm,
    bool hasImage,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasImage) ...[
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.memory(
                    iniciativaForm.uploadedImage!.bytes!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.white12,
                        child: const Center(
                          child: Icon(Icons.broken_image,
                              color: Colors.white54, size: 48),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Material(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          safeSetState(() {
                            _model.updateIniciativaForm(
                              escenarioIndex,
                              iniciativaIndex,
                              (form) => EscenarioIniciativaFormData(
                                tituloController: form.tituloController,
                                tituloFocusNode: form.tituloFocusNode,
                                descripcionController: form.descripcionController,
                                descripcionFocusNode: form.descripcionFocusNode,
                                capacidadesForms: form.capacidadesForms,
                                imagenController: form.imagenController,
                                imagenFocusNode: form.imagenFocusNode,
                                uploadedImage: FFUploadedFile(
                                    bytes: Uint8List.fromList([]),
                                    originalFilename: ''),
                                imageUrl: '',
                                isUploadingImage: false,
                              ),
                            );
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.close, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
        InkWell(
          onTap: () async {
            final selectedMedia = await selectMedia(
              mediaSource: MediaSource.photoGallery,
              multiImage: false,
            );
            if (selectedMedia != null &&
                selectedMedia.every((m) =>
                    validateFileFormat(m.storagePath, context))) {
              // Guardar solo localmente para preview
              var selectedUploadedFiles = selectedMedia
                  .map((m) => FFUploadedFile(
                        name: m.storagePath.split('/').last,
                        bytes: m.bytes,
                        height: m.dimensions?.height,
                        width: m.dimensions?.width,
                        blurHash: m.blurHash,
                        originalFilename: m.originalFilename,
                      ))
                  .toList();

              safeSetState(() {
                _model.updateIniciativaForm(
                  escenarioIndex,
                  iniciativaIndex,
                  (form) => EscenarioIniciativaFormData(
                    tituloController: form.tituloController,
                    tituloFocusNode: form.tituloFocusNode,
                    descripcionController: form.descripcionController,
                    descripcionFocusNode: form.descripcionFocusNode,
                    capacidadesForms: form.capacidadesForms,
                    imagenController: form.imagenController,
                    imagenFocusNode: form.imagenFocusNode,
                    uploadedImage: selectedUploadedFiles.isNotEmpty
                        ? selectedUploadedFiles.first
                        : form.uploadedImage,
                    imageUrl: '', // Se subirá al guardar
                    isUploadingImage: false,
                  ),
                );
              });
            }
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: hasImage
                  ? Colors.white.withOpacity(0.05)
                  : Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  hasImage ? Icons.image : Icons.add_photo_alternate_rounded,
                  color: Colors.white,
                  size: 28.0,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    hasImage ? 'Cambiar imagen' : 'Subir imagen',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (iniciativaForm.isUploadingImage)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

