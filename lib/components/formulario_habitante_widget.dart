import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'formulario_habitante_model.dart';
export 'formulario_habitante_model.dart';

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

class FormularioHabitanteWidget extends StatefulWidget {
  const FormularioHabitanteWidget({super.key});

  @override
  State<FormularioHabitanteWidget> createState() =>
      _FormularioHabitanteWidgetState();
}

class _FormularioHabitanteWidgetState extends State<FormularioHabitanteWidget> {
  late FormularioHabitanteModel _model;
  final _formKey = GlobalKey<FormState>();

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormularioHabitanteModel());

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

  Future<void> _pickImage() async {
    final selectedMedia = await selectMedia(
      mediaSource: MediaSource.photoGallery,
      multiImage: false,
    );
    if (selectedMedia == null) return;

    if (!selectedMedia
        .every((m) => validateFileFormat(m.storagePath, context))) {
      return;
    }

    // Guardar solo localmente para preview
    final uploadedFiles = selectedMedia
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
      _model.uploadedLocalFile_imagenesHabitantePortada = uploadedFiles.first;
      _model.uploadedFileUrl_imagenesHabitantePortada =
          ''; // Se subirá al guardar
    });
  }

  Future<void> _pickAudio() async {
    final selectedFiles =
        await selectFiles(allowedExtensions: ['mp3'], multiFile: false);
    if (selectedFiles == null) return;

    // Guardar solo localmente para preview
    final uploadedFiles = selectedFiles
        .map((m) => FFUploadedFile(
              name: m.storagePath.split('/').last,
              bytes: m.bytes,
              originalFilename: m.originalFilename,
            ))
        .toList();

    safeSetState(() {
      _model.uploadedLocalFile_audiosAudioHabitante = uploadedFiles.first;
      _model.uploadedFileUrl_audiosAudioHabitante = ''; // Se subirá al guardar
    });
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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header con título y switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'El Habitante',
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
                        value: _model.switchValue ?? true,
                        onChanged: (v) =>
                            safeSetState(() => _model.switchValue = v),
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
                    decoration: _buildInputDecoration('Título de sección'),
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    inputFormatters: [SentenceCaseFormatter()],
                    cursorColor: Colors.white,
                    validator: (s) => (s == null || s.trim().isEmpty)
                        ? 'Ingrese un título'
                        : null,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _model.textController2,
                    focusNode: _model.textFieldFocusNode2,
                    decoration: _buildInputDecoration('Subtítulo de sección'),
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    inputFormatters: [SentenceCaseFormatter()],
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _model.textController3,
                    focusNode: _model.textFieldFocusNode3,
                    decoration: _buildInputDecoration('Nombre de habitante'),
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    inputFormatters: [SentenceCaseFormatter()],
                    cursorColor: Colors.white,
                    validator: (s) => (s == null || s.trim().isEmpty)
                        ? 'Ingrese un nombre'
                        : null,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _model.textController4,
                    focusNode: _model.textFieldFocusNode4,
                    decoration: _buildInputDecoration(
                      'Descripción',
                      hint: 'Escribe una descripción...',
                    ),
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                    minLines: 6,
                    maxLines: null,
                    maxLength: 581,
                    textCapitalization: TextCapitalization.sentences,
                    inputFormatters: [SentenceCaseFormatter()],
                    cursorColor: Colors.white,
                    validator: (s) => (s == null || s.trim().length < 10)
                        ? 'Descripción demasiado corta'
                        : null,
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

              const SizedBox(height: 24),

              // Upload de imagen con preview
              _buildImageUploadSection(),

              const SizedBox(height: 20),

              // Upload de audio con preview
              _buildAudioUploadSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageUploadSection() {
    final hasImage =
        _model.uploadedLocalFile_imagenesHabitantePortada.bytes != null &&
            _model.uploadedLocalFile_imagenesHabitantePortada.bytes!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Imagen del Habitante',
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
                  Image.memory(
                    _model.uploadedLocalFile_imagenesHabitantePortada.bytes!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.white12,
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.white54,
                            size: 48,
                          ),
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
                            _model.uploadedLocalFile_imagenesHabitantePortada =
                                FFUploadedFile(
                                    bytes: Uint8List.fromList([]),
                                    originalFilename: '');
                            _model.uploadedFileUrl_imagenesHabitantePortada =
                                '';
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
          onTap: _pickImage,
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
                        ? 'Cambiar imagen del habitante'
                        : 'Subir imagen del habitante',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (_model.isDataUploading_imagenesHabitantePortada)
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

  Widget _buildAudioUploadSection() {
    final hasAudio =
        _model.uploadedLocalFile_audiosAudioHabitante.bytes != null &&
            _model.uploadedLocalFile_audiosAudioHabitante.bytes!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Audio del Habitante',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        if (hasAudio) ...[
          // Preview/indicador de Audio
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
                    color: const Color(0xFF8B5CF6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.audiotrack,
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
                        _model.uploadedLocalFile_audiosAudioHabitante
                                .originalFilename.isNotEmpty
                            ? _model.uploadedLocalFile_audiosAudioHabitante
                                .originalFilename
                            : 'audio.mp3',
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
                        'Audio guardado localmente',
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
                        _model.uploadedLocalFile_audiosAudioHabitante =
                            FFUploadedFile(
                                bytes: Uint8List.fromList([]),
                                originalFilename: '');
                        _model.uploadedFileUrl_audiosAudioHabitante = '';
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
          onTap: _pickAudio,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: hasAudio
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
                  hasAudio ? Icons.audio_file : Icons.upload_file_rounded,
                  color: Colors.white,
                  size: 28.0,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    hasAudio
                        ? 'Cambiar audio'
                        : 'Subir audio del habitante (mp3)',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (_model.isDataUploading_audiosAudioHabitante)
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
