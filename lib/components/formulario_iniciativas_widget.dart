import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'formulario_iniciativas_model.dart';
export 'formulario_iniciativas_model.dart';

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

class FormularioIniciativasWidget extends StatefulWidget {
  const FormularioIniciativasWidget({super.key});

  @override
  State<FormularioIniciativasWidget> createState() =>
      _FormularioIniciativasWidgetState();
}

class _FormularioIniciativasWidgetState
    extends State<FormularioIniciativasWidget> {
  late FormularioIniciativasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormularioIniciativasModel());

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
                    'Iniciativas',
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
            const SizedBox(height: 24),

            // Campo Título de sección
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

            // Campo Subtítulo de sección
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
              maxLength: 175,
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [SentenceCaseFormatter()],
              cursorColor: Colors.white,
              validator: _model.textController2Validator.asValidator(context),
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
}

