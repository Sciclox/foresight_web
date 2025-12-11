import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:typed_data';
import 'formulario_tendencias_model.dart';
export 'formulario_tendencias_model.dart';

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

class FormularioTendenciasWidget extends StatefulWidget {
  const FormularioTendenciasWidget({super.key});

  @override
  State<FormularioTendenciasWidget> createState() =>
      _FormularioTendenciasWidgetState();
}

class _FormularioTendenciasWidgetState extends State<FormularioTendenciasWidget> {
  late FormularioTendenciasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormularioTendenciasModel());

    _model.switchValue1 = true;
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
                    'Tendencias',
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
              maxLength: 237,
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

            // Lista de formularios de tendencias
            if (_model.tendenciasForms.isNotEmpty)
              Column(
                children: _model.tendenciasForms.asMap().entries.map((entry) {
                  final index = entry.key;
                  final tendenciaForm = entry.value;
                  return _buildTendenciaForm(index, tendenciaForm);
                }).toList(),
              ),

            const SizedBox(height: 16),

            // Botón para agregar nueva tendencia
            InkWell(
                onTap: () {
                  safeSetState(() {
                    _model.addTendenciaForm();
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
                        'Agregar Tendencia',
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

  Widget _buildTendenciaForm(int index, TendenciaFormData tendenciaForm) {

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
                  'Tendencia ${index + 1}',
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
                        _model.removeTendenciaForm(index);
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

            // Campos de texto
            TextFormField(
              controller: tendenciaForm.tituloController,
              focusNode: tendenciaForm.tituloFocusNode,
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

            // Campo de subtítulo de card
            TextFormField(
              controller: tendenciaForm.subtituloCardController,
              focusNode: tendenciaForm.subtituloCardFocusNode,
              decoration: _buildInputDecoration('Subtítulo de Card'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              maxLength: 76,
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
              controller: tendenciaForm.subtituloController,
              focusNode: tendenciaForm.subtituloFocusNode,
              decoration: _buildInputDecoration('Subtítulo'),
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
              controller: tendenciaForm.descripcionController,
              focusNode: tendenciaForm.descripcionFocusNode,
              decoration: _buildInputDecoration('Descripción'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 6,
              minLines: 4,
              maxLength: 267,
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

            // Campo de probabilidad como dropdown
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Probabilidad',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.white24, width: 1.5),
                  ),
                  child: _buildProbabilidadDropdown(index, tendenciaForm),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Campo de imagen de portada
            _buildImagenPortadaSection(index, tendenciaForm),
            const SizedBox(height: 24),

            // Sección de Impactos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Impactos',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    safeSetState(() {
                      _model.addImpactoForm(index);
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
            
            // Lista de formularios de impactos
            if (tendenciaForm.impactosForms.isNotEmpty)
              Column(
                children: tendenciaForm.impactosForms.asMap().entries.map((entry) {
                  final impactoIndex = entry.key;
                  final impactoForm = entry.value;
                  return _buildImpactoForm(index, impactoIndex, impactoForm);
                }).toList(),
              ),
            const SizedBox(height: 24),

            // Sección de Señales
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Señales',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    safeSetState(() {
                      _model.addSenaleForm(index);
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

            // Lista de formularios de señales
            if (tendenciaForm.senalesForms.isNotEmpty)
              Column(
                children: tendenciaForm.senalesForms.asMap().entries.map((entry) {
                  final senaleIndex = entry.key;
                  final senaleForm = entry.value;
                  return _buildSenaleForm(index, senaleIndex, senaleForm);
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildImpactoForm(int tendenciaIndex, int impactoIndex, ImpactoFormData impactoForm) {
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
                  'Impacto ${impactoIndex + 1}',
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
                        _model.removeImpactoForm(tendenciaIndex, impactoIndex);
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
              controller: impactoForm.controller,
              focusNode: impactoForm.focusNode,
              decoration: _buildInputDecoration('Párrafo de impacto'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 6,
              minLines: 4,
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [SentenceCaseFormatter()],
              cursorColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSenaleForm(int tendenciaIndex, int senaleIndex, SenaleFormData senaleForm) {
    final hasImage = senaleForm.uploadedImage?.bytes != null &&
        senaleForm.uploadedImage!.bytes!.isNotEmpty;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Señal ${senaleIndex + 1}',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
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
                        _model.removeSenaleForm(tendenciaIndex, senaleIndex);
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

            // Imagen de señal
            _buildSenaleImageUploadSection(tendenciaIndex, senaleIndex, senaleForm, hasImage),
            const SizedBox(height: 16),

            TextFormField(
              controller: senaleForm.tituloController,
              focusNode: senaleForm.tituloFocusNode,
              decoration: _buildInputDecoration('Título de señal'),
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
              controller: senaleForm.descripcionController,
              focusNode: senaleForm.descripcionFocusNode,
              decoration: _buildInputDecoration('Descripción de señal'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 4,
              minLines: 3,
              maxLength: 240,
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
              controller: senaleForm.textoEnlaceController,
              focusNode: senaleForm.textoEnlaceFocusNode,
              decoration: _buildInputDecoration('Texto de enlace'),
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

  Widget _buildSenaleImageUploadSection(int tendenciaIndex, int senaleIndex, SenaleFormData senaleForm, bool hasImage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                    senaleForm.uploadedImage!.bytes!,
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
                            _model.updateSenaleForm(
                              tendenciaIndex,
                              senaleIndex,
                              (form) => SenaleFormData(
                                tituloController: form.tituloController,
                                tituloFocusNode: form.tituloFocusNode,
                                descripcionController: form.descripcionController,
                                descripcionFocusNode: form.descripcionFocusNode,
                                textoEnlaceController: form.textoEnlaceController,
                                textoEnlaceFocusNode: form.textoEnlaceFocusNode,
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
                _model.updateSenaleForm(
                  tendenciaIndex,
                  senaleIndex,
                  (form) => SenaleFormData(
                    tituloController: form.tituloController,
                    tituloFocusNode: form.tituloFocusNode,
                    descripcionController: form.descripcionController,
                    descripcionFocusNode: form.descripcionFocusNode,
                    textoEnlaceController: form.textoEnlaceController,
                    textoEnlaceFocusNode: form.textoEnlaceFocusNode,
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
                    hasImage ? 'Cambiar imagen' : 'Subir imagen de señal',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (senaleForm.isUploadingImage)
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

  Widget _buildProbabilidadDropdown(int index, TendenciaFormData tendenciaForm) {
    final probabilidades = ['Alto', 'Medio', 'Bajo'];
    
    return DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            value: tendenciaForm.probabilidad,
            hint: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Seleccionar probabilidad',
                style: GoogleFonts.inter(
                  color: Colors.white54,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            items: probabilidades.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    item,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? val) {
              safeSetState(() {
                _model.updateTendenciaForm(
                  index,
                  (form) => TendenciaFormData(
                    tempId: form.tempId,
                    tituloController: form.tituloController,
                    tituloFocusNode: form.tituloFocusNode,
                    subtituloController: form.subtituloController,
                    subtituloFocusNode: form.subtituloFocusNode,
                    descripcionController: form.descripcionController,
                    descripcionFocusNode: form.descripcionFocusNode,
                    subtituloCardController: form.subtituloCardController,
                    subtituloCardFocusNode: form.subtituloCardFocusNode,
                    probabilidad: val,
                    uploadedImagenPortada: form.uploadedImagenPortada,
                    imagenPortadaUrl: form.imagenPortadaUrl,
                    impactosForms: form.impactosForms,
                    senalesForms: form.senalesForms,
                  ),
                );
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 56.0,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Colors.transparent),
              ),
              overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
                if (states.contains(WidgetState.hovered)) {
                  return Colors.white.withOpacity(0.1);
                }
                return null;
              }),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white70,
                size: 24.0,
              ),
              iconEnabledColor: Colors.white70,
              iconDisabledColor: Colors.white38,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 300,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
                color: const Color(0xFF0F092C).withOpacity(0.95),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 30,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              offset: const Offset(0, 4),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: WidgetStateProperty.all<double>(6),
                thumbVisibility: WidgetStateProperty.all<bool>(true),
                thumbColor: WidgetStateProperty.all<Color>(Colors.white.withOpacity(0.3)),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
                if (states.contains(WidgetState.hovered) ||
                    states.contains(WidgetState.focused)) {
                  return Colors.white.withOpacity(0.2);
                }
                return null;
              }),
            ),
            dropdownSearchData: null,
            isExpanded: true,
          ),
        );
  }

  Widget _buildImagenPortadaSection(int index, TendenciaFormData tendenciaForm) {
    final hasImage = tendenciaForm.uploadedImagenPortada?.bytes != null &&
        tendenciaForm.uploadedImagenPortada!.bytes!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Imagen de Portada',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        if (hasImage) ...[
          // Preview de imagen
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
                    tendenciaForm.uploadedImagenPortada!.bytes!,
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
                  // Overlay con botón de eliminar
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
                            _model.updateTendenciaForm(
                              index,
                              (form) => TendenciaFormData(
                                tempId: form.tempId,
                                tituloController: form.tituloController,
                                tituloFocusNode: form.tituloFocusNode,
                                subtituloController: form.subtituloController,
                                subtituloFocusNode: form.subtituloFocusNode,
                                descripcionController: form.descripcionController,
                                descripcionFocusNode: form.descripcionFocusNode,
                                subtituloCardController: form.subtituloCardController,
                                subtituloCardFocusNode: form.subtituloCardFocusNode,
                                probabilidad: form.probabilidad,
                                uploadedImagenPortada: FFUploadedFile(
                                    bytes: Uint8List.fromList([]),
                                    originalFilename: ''),
                                imagenPortadaUrl: '',
                                impactosForms: form.impactosForms,
                                senalesForms: form.senalesForms,
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
        // Botón de subir
        InkWell(
          onTap: () async {
            final selectedMedia = await selectMedia(
              mediaSource: MediaSource.photoGallery,
              multiImage: false,
            );
            if (selectedMedia != null &&
                selectedMedia
                    .every((m) => validateFileFormat(m.storagePath, context))) {
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
                _model.updateTendenciaForm(
                  index,
                  (form) => TendenciaFormData(
                    tituloController: form.tituloController,
                    tituloFocusNode: form.tituloFocusNode,
                    subtituloController: form.subtituloController,
                    subtituloFocusNode: form.subtituloFocusNode,
                    descripcionController: form.descripcionController,
                    descripcionFocusNode: form.descripcionFocusNode,
                    subtituloCardController: form.subtituloCardController,
                    subtituloCardFocusNode: form.subtituloCardFocusNode,
                    probabilidad: form.probabilidad,
                    uploadedImagenPortada: selectedUploadedFiles.isNotEmpty
                        ? selectedUploadedFiles.first
                        : form.uploadedImagenPortada,
                    imagenPortadaUrl: '', // Se subirá al guardar
                    impactosForms: form.impactosForms,
                    senalesForms: form.senalesForms,
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
                    hasImage ? 'Cambiar imagen' : 'Subir imagen de portada',
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
}

