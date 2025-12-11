import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'formulario_reporte_principal_model.dart';
export 'formulario_reporte_principal_model.dart';

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

class FormularioReportePrincipalWidget extends StatefulWidget {
  const FormularioReportePrincipalWidget({super.key});

  @override
  State<FormularioReportePrincipalWidget> createState() =>
      _FormularioReportePrincipalWidgetState();
}

class _FormularioReportePrincipalWidgetState
    extends State<FormularioReportePrincipalWidget> {
  late FormularioReportePrincipalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormularioReportePrincipalModel());

    _model.switchValue = true;
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

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
      contentPadding:
          const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 16.0),
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
                        'Inicio del Reporte',
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
                      _model.switchValue == true
                          ? 'Habilitado'
                          : 'Deshabilitado',
                      style: GoogleFonts.inter(
                        color: _model.switchValue == true
                            ? const Color(0xFF10B981)
                            : const Color(0xFFEF4444),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 12),
                      Switch.adaptive(
                        value: _model.switchValue!,
                        onChanged: (newValue) async {
                          safeSetState(() => _model.switchValue = newValue);
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
            const SizedBox(height: 24),

            // Campos de texto
            Column(
              mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _model.textController1,
                      focusNode: _model.textFieldFocusNode1,
                  decoration: _buildInputDecoration('Etiqueta'),
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  inputFormatters: [SentenceCaseFormatter()],
                  cursorColor: Colors.white,
                      validator:
                          _model.textController1Validator.asValidator(context),
                    ),
                const SizedBox(height: 16),
                    TextFormField(
                      controller: _model.textController2,
                      focusNode: _model.textFieldFocusNode2,
                  decoration: _buildInputDecoration('Título'),
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  inputFormatters: [SentenceCaseFormatter()],
                  cursorColor: Colors.white,
                      validator:
                          _model.textController2Validator.asValidator(context),
                    ),
                const SizedBox(height: 16),
                    TextFormField(
                      controller: _model.textController3,
                      focusNode: _model.textFieldFocusNode3,
                  decoration: _buildInputDecoration('Descripción',
                      hint: 'Escribe la descripción aquí...'),
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 6,
                  minLines: 4,
                  maxLength: 180,
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
                      validator:
                          _model.textController3Validator.asValidator(context),
                    ),
                const SizedBox(height: 16),
                    TextFormField(
                      controller: _model.textController4,
                      focusNode: _model.textFieldFocusNode4,
                  decoration: _buildInputDecoration('Nombre singular dropdown'),
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  inputFormatters: [SentenceCaseFormatter()],
                  cursorColor: Colors.white,
                  validator:
                      _model.textController4Validator.asValidator(context),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Upload de imagen con preview
            _buildImageUploadSection(),

            const SizedBox(height: 20),

            // Upload de PDF con preview
            _buildPDFUploadSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageUploadSection() {
    final hasLocalImage =
        _model.uploadedLocalFile_imagenesReportePortada.bytes != null &&
            _model.uploadedLocalFile_imagenesReportePortada.bytes!.isNotEmpty;
    final hasImageUrl = _model.uploadedFileUrl_imagenesReportePortada.isNotEmpty;
    final hasImage = hasLocalImage || hasImageUrl;

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
              border:
                  Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
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
                  hasLocalImage
                      ? Image.memory(
                          _model.uploadedLocalFile_imagenesReportePortada.bytes!,
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
                        )
                      : Image.network(
                          _model.uploadedFileUrl_imagenesReportePortada,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: Colors.white12,
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                  color: Colors.white,
                                ),
                      ),
                            );
                          },
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
                            _model.uploadedLocalFile_imagenesReportePortada =
                                FFUploadedFile(
                                    bytes: Uint8List.fromList([]),
                                    originalFilename: '');
                            _model.uploadedFileUrl_imagenesReportePortada = '';
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child:
                              Icon(Icons.close, color: Colors.white, size: 20),
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
                            _model.uploadedLocalFile_imagenesReportePortada =
                                selectedUploadedFiles.first;
                _model.uploadedFileUrl_imagenesReportePortada = ''; // Se subirá al guardar
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
                    hasImage
                        ? 'Cambiar imagen de portada'
                        : 'Subir imagen de portada',
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

  Widget _buildPDFUploadSection() {
    final hasLocalPDF = _model.uploadedLocalFile_reportesReportePDF.bytes != null &&
        _model.uploadedLocalFile_reportesReportePDF.bytes!.isNotEmpty;
    final hasPDFUrl = _model.uploadedFileUrl_reportesReportePDF.isNotEmpty;
    final hasPDF = hasLocalPDF || hasPDFUrl;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PDF del Reporte',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            color: Colors.white,
                ),
              ),
        const SizedBox(height: 12),
        if (hasPDF) ...[
          // Preview/indicador de PDF
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16.0),
              border:
                  Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
            ),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4444),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.picture_as_pdf,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hasLocalPDF && _model.uploadedLocalFile_reportesReportePDF
                                .originalFilename.isNotEmpty
                            ? _model.uploadedLocalFile_reportesReportePDF
                                .originalFilename
                            : 'reporte.pdf',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        hasLocalPDF ? 'PDF guardado localmente' : 'PDF desde servidor',
                        style: GoogleFonts.inter(
                          color: Colors.white70,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      safeSetState(() {
                        _model.uploadedLocalFile_reportesReportePDF =
                            FFUploadedFile(
                                bytes: Uint8List.fromList([]),
                                originalFilename: '');
                        _model.uploadedFileUrl_reportesReportePDF = '';
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.close, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
        // Botón de subir
        InkWell(
                  onTap: () async {
                    final selectedFiles = await selectFiles(
                      allowedExtensions: ['pdf'],
                      multiFile: false,
                    );
                    if (selectedFiles != null) {
              // Guardar solo localmente para preview
              var selectedUploadedFiles = selectedFiles
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  originalFilename: m.originalFilename,
                                ))
                            .toList();

                        safeSetState(() {
                          _model.uploadedLocalFile_reportesReportePDF =
                              selectedUploadedFiles.first;
                _model.uploadedFileUrl_reportesReportePDF = ''; // Se subirá al guardar
                        });
                    }
                  },
                  child: Container(
                    width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    decoration: BoxDecoration(
              color: hasPDF
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
                  hasPDF ? Icons.insert_drive_file : Icons.upload_file_rounded,
                  color: Colors.white,
                  size: 28.0,
                          ),
                const SizedBox(width: 16),
                Expanded(
                            child: Text(
                    hasPDF ? 'Cambiar PDF' : 'Subir PDF del reporte',
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
