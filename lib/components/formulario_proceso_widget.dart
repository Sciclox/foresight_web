import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:typed_data';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'formulario_proceso_model.dart';
export 'formulario_proceso_model.dart';

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

class FormularioProcesoWidget extends StatefulWidget {
  const FormularioProcesoWidget({super.key});

  @override
  State<FormularioProcesoWidget> createState() =>
      _FormularioProcesoWidgetState();
}

class _FormularioProcesoWidgetState extends State<FormularioProcesoWidget> {
  late FormularioProcesoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormularioProcesoModel());

    _model.switchValue1 = true;
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

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
                      'El proceso de autoconstrucción',
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
            const SizedBox(height: 24),

            // Lista de formularios de proceso
            if (_model.procesosForms.isNotEmpty)
              Column(
                children: _model.procesosForms.asMap().entries.map((entry) {
                  final index = entry.key;
                  final procesoForm = entry.value;
                  return _buildProcesoForm(index, procesoForm);
                }).toList(),
              ),

            const SizedBox(height: 16),

            // Botón para agregar nuevo proceso
            if (_model.procesosForms.length < 5)
              InkWell(
                onTap: () {
                  safeSetState(() {
                    _model.addProcesoForm();
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
                        'Agregar Proceso',
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

  Widget _buildProcesoForm(int index, ProcesoFormData procesoForm) {
    final hasImage = procesoForm.uploadedImage?.bytes != null &&
        procesoForm.uploadedImage!.bytes!.isNotEmpty;

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
                  'Proceso ${index + 1}',
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
                        _model.removeProcesoForm(index);
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

            // Dropdown de periodo
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Colors.white24, width: 1.5),
              ),
              child: _buildCustomDropdown(index, procesoForm),
            ),
            const SizedBox(height: 16),

            // Campos de texto
                                TextFormField(
              controller: procesoForm.tituloController,
              focusNode: procesoForm.tituloFocusNode,
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
              controller: procesoForm.subtituloController,
              focusNode: procesoForm.subtituloFocusNode,
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

            // Color picker
            _buildColorPickerField(index, procesoForm),
            const SizedBox(height: 16),

                                TextFormField(
              controller: procesoForm.descripcionController,
              focusNode: procesoForm.descripcionFocusNode,
              decoration: _buildInputDecoration('Descripción'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                                            fontWeight: FontWeight.w500,
              ),
              maxLines: 6,
              minLines: 4,
              maxLength: 211,
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
              controller: procesoForm.citaController,
              focusNode: procesoForm.citaFocusNode,
              decoration: _buildInputDecoration('Cita'),
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

            // Upload de imagen con preview
            _buildImageUploadSection(index, procesoForm, hasImage),
            const SizedBox(height: 16),

            // Switches
            _buildSwitchRow(
              'Agua/Saneamiento',
              procesoForm.agua,
              (value) {
                safeSetState(() {
                  _model.updateProcesoForm(
                    index,
                    (form) => ProcesoFormData(
                      periodo: form.periodo,
                      tituloController: form.tituloController,
                      tituloFocusNode: form.tituloFocusNode,
                      subtituloController: form.subtituloController,
                      subtituloFocusNode: form.subtituloFocusNode,
                      colorSubtituloController: form.colorSubtituloController,
                      colorSubtituloFocusNode: form.colorSubtituloFocusNode,
                      selectedColor: form.selectedColor,
                      descripcionController: form.descripcionController,
                      descripcionFocusNode: form.descripcionFocusNode,
                      citaController: form.citaController,
                      citaFocusNode: form.citaFocusNode,
                      dineroTextController: form.dineroTextController,
                      dineroTextFocusNode: form.dineroTextFocusNode,
                      agua: value,
                      urbanizacion: form.urbanizacion,
                      dinero: form.dinero,
                      uploadedImage: form.uploadedImage,
                      imageUrl: form.imageUrl,
                      isUploadingImage: form.isUploadingImage,
                    ),
                  );
                });
              },
            ),
            const SizedBox(height: 12),

            _buildSwitchRow(
              'Urbanización',
              procesoForm.urbanizacion,
              (value) {
                safeSetState(() {
                  _model.updateProcesoForm(
                    index,
                    (form) => ProcesoFormData(
                      periodo: form.periodo,
                      tituloController: form.tituloController,
                      tituloFocusNode: form.tituloFocusNode,
                      subtituloController: form.subtituloController,
                      subtituloFocusNode: form.subtituloFocusNode,
                      colorSubtituloController: form.colorSubtituloController,
                      colorSubtituloFocusNode: form.colorSubtituloFocusNode,
                      selectedColor: form.selectedColor,
                      descripcionController: form.descripcionController,
                      descripcionFocusNode: form.descripcionFocusNode,
                      citaController: form.citaController,
                      citaFocusNode: form.citaFocusNode,
                      dineroTextController: form.dineroTextController,
                      dineroTextFocusNode: form.dineroTextFocusNode,
                      agua: form.agua,
                      urbanizacion: value,
                      dinero: form.dinero,
                      uploadedImage: form.uploadedImage,
                      imageUrl: form.imageUrl,
                      isUploadingImage: form.isUploadingImage,
                    ),
                  );
                });
              },
            ),
            const SizedBox(height: 12),

            _buildSwitchRow(
              'S/.',
              procesoForm.dinero,
              (value) {
                safeSetState(() {
                  _model.updateProcesoForm(
                    index,
                    (form) => ProcesoFormData(
                      periodo: form.periodo,
                      tituloController: form.tituloController,
                      tituloFocusNode: form.tituloFocusNode,
                      subtituloController: form.subtituloController,
                      subtituloFocusNode: form.subtituloFocusNode,
                      colorSubtituloController: form.colorSubtituloController,
                      colorSubtituloFocusNode: form.colorSubtituloFocusNode,
                      selectedColor: form.selectedColor,
                      descripcionController: form.descripcionController,
                      descripcionFocusNode: form.descripcionFocusNode,
                      citaController: form.citaController,
                      citaFocusNode: form.citaFocusNode,
                      dineroTextController: form.dineroTextController,
                      dineroTextFocusNode: form.dineroTextFocusNode,
                      agua: form.agua,
                      urbanizacion: form.urbanizacion,
                      dinero: value,
                      uploadedImage: form.uploadedImage,
                      imageUrl: form.imageUrl,
                      isUploadingImage: form.isUploadingImage,
                    ),
                  );
                });
              },
            ),
            if (procesoForm.dinero) ...[
              const SizedBox(height: 16),
                                TextFormField(
                controller: procesoForm.dineroTextController,
                focusNode: procesoForm.dineroTextFocusNode,
                decoration: _buildInputDecoration('S/.'),
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
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchRow(String label, bool value, Function(bool) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
                                      borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
                                    ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF0F092C),
            activeTrackColor: const Color(0xFF10B981),
            inactiveTrackColor: Colors.white24,
            inactiveThumbColor: Colors.white70,
          ),
        ],
      ),
    );
  }

  Widget _buildImageUploadSection(int index, ProcesoFormData procesoForm, bool hasImage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Imagen del Proceso',
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
                    procesoForm.uploadedImage!.bytes!,
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
                            _model.updateProcesoForm(
                              index,
                              (form) => ProcesoFormData(
                                periodo: form.periodo,
                                tituloController: form.tituloController,
                                tituloFocusNode: form.tituloFocusNode,
                                subtituloController: form.subtituloController,
                                subtituloFocusNode: form.subtituloFocusNode,
                                colorSubtituloController:
                                    form.colorSubtituloController,
                                colorSubtituloFocusNode:
                                    form.colorSubtituloFocusNode,
                                selectedColor: form.selectedColor,
                                descripcionController: form.descripcionController,
                                descripcionFocusNode: form.descripcionFocusNode,
                                citaController: form.citaController,
                                citaFocusNode: form.citaFocusNode,
                                dineroTextController: form.dineroTextController,
                                dineroTextFocusNode: form.dineroTextFocusNode,
                                agua: form.agua,
                                urbanizacion: form.urbanizacion,
                                dinero: form.dinero,
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
                _model.updateProcesoForm(
                  index,
                  (form) => ProcesoFormData(
                    periodo: form.periodo,
                    tituloController: form.tituloController,
                    tituloFocusNode: form.tituloFocusNode,
                    subtituloController: form.subtituloController,
                    subtituloFocusNode: form.subtituloFocusNode,
                    colorSubtituloController: form.colorSubtituloController,
                    colorSubtituloFocusNode: form.colorSubtituloFocusNode,
                    selectedColor: form.selectedColor,
                    descripcionController: form.descripcionController,
                    descripcionFocusNode: form.descripcionFocusNode,
                    citaController: form.citaController,
                    citaFocusNode: form.citaFocusNode,
                    dineroTextController: form.dineroTextController,
                    dineroTextFocusNode: form.dineroTextFocusNode,
                    agua: form.agua,
                    urbanizacion: form.urbanizacion,
                    dinero: form.dinero,
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
                    hasImage ? 'Cambiar imagen' : 'Subir imagen del proceso',
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

  Widget _buildCustomDropdown(int index, ProcesoFormData procesoForm) {
    const periodOptions = [
      '1-3 años',
      '3-5 años',
      '5-12 años',
      '12-15 años',
      '16 años o mas'
    ];

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value: procesoForm.periodo,
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Seleccionar periodo',
            style: GoogleFonts.inter(
              color: Colors.white54,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        items: periodOptions.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
                                  child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                option,
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
            _model.updateProcesoForm(
              index,
              (form) => ProcesoFormData(
                periodo: val,
                tituloController: form.tituloController,
                tituloFocusNode: form.tituloFocusNode,
                subtituloController: form.subtituloController,
                subtituloFocusNode: form.subtituloFocusNode,
                colorSubtituloController: form.colorSubtituloController,
                colorSubtituloFocusNode: form.colorSubtituloFocusNode,
                selectedColor: form.selectedColor,
                descripcionController: form.descripcionController,
                descripcionFocusNode: form.descripcionFocusNode,
                citaController: form.citaController,
                citaFocusNode: form.citaFocusNode,
                dineroTextController: form.dineroTextController,
                dineroTextFocusNode: form.dineroTextFocusNode,
                agua: form.agua,
                urbanizacion: form.urbanizacion,
                dinero: form.dinero,
                uploadedImage: form.uploadedImage,
                imageUrl: form.imageUrl,
                isUploadingImage: form.isUploadingImage,
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

  Widget _buildColorPickerField(int index, ProcesoFormData procesoForm) {
    Color currentColor = procesoForm.selectedColor ?? const Color(0xFFF54927);
    String hexColor = '#${currentColor.value.toRadixString(16).substring(2).toUpperCase()}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
          'Color de subtítulo',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                Color pickerColor = currentColor;
                return StatefulBuilder(
                  builder: (context, setDialogState) {
                    return AlertDialog(
                      backgroundColor: const Color(0xFF0F092C),
                      title: Text(
                        'Seleccionar Color',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                                              ),
                      content: SingleChildScrollView(
                        child: BlockPicker(
                          pickerColor: pickerColor,
                          onColorChanged: (Color color) {
                            setDialogState(() {
                              pickerColor = color;
                            });
                                              },
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancelar',
                            style: GoogleFonts.inter(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6F61EF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            final hexValue = pickerColor.value.toRadixString(16).substring(2).toUpperCase();
                            safeSetState(() {
                              _model.updateProcesoForm(
                                index,
                                (form) => ProcesoFormData(
                                  periodo: form.periodo,
                                  tituloController: form.tituloController,
                                  tituloFocusNode: form.tituloFocusNode,
                                  subtituloController: form.subtituloController,
                                  subtituloFocusNode: form.subtituloFocusNode,
                                  colorSubtituloController: form.colorSubtituloController
                                    ..text = '#$hexValue',
                                  colorSubtituloFocusNode: form.colorSubtituloFocusNode,
                                  selectedColor: pickerColor,
                                  descripcionController: form.descripcionController,
                                  descripcionFocusNode: form.descripcionFocusNode,
                                  citaController: form.citaController,
                                  citaFocusNode: form.citaFocusNode,
                                  dineroTextController: form.dineroTextController,
                                  dineroTextFocusNode: form.dineroTextFocusNode,
                                  agua: form.agua,
                                  urbanizacion: form.urbanizacion,
                                  dinero: form.dinero,
                                  uploadedImage: form.uploadedImage,
                                  imageUrl: form.imageUrl,
                                  isUploadingImage: form.isUploadingImage,
                                ),
                              );
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Seleccionar',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            ),
                          ),
                        ],
                    );
                  },
                );
              },
            );
          },
          child: Container(
            width: double.infinity,
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                color: Colors.white24,
                width: 1.5,
                              ),
                            ),
            child: Row(
                                children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: currentColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: currentColor.withOpacity(0.5),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                                                  ),
                                            ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    hexColor,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white70,
                  size: 16,
                                      ),
                                    ],
                                  ),
          ),
              ),
      ],
    );
  }
}
