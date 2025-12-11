import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'formulario_cifras_model.dart';
export 'formulario_cifras_model.dart';

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

class FormularioCifrasWidget extends StatefulWidget {
  const FormularioCifrasWidget({super.key});

  @override
  State<FormularioCifrasWidget> createState() =>
      _FormularioCifrasWidgetState();
}

class _FormularioCifrasWidgetState extends State<FormularioCifrasWidget> {
  late FormularioCifrasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormularioCifrasModel());

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
                    'Cifras',
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

            // Lista de formularios de cifras
            if (_model.cifrasForms.isNotEmpty)
              Column(
                children: _model.cifrasForms.asMap().entries.map((entry) {
                  final index = entry.key;
                  final cifraForm = entry.value;
                  return _buildCifraForm(index, cifraForm);
                }).toList(),
              ),

            const SizedBox(height: 16),

            // Botón para agregar nueva cifra
            InkWell(
                onTap: () {
                  safeSetState(() {
                    _model.addCifraForm();
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
                        'Agregar Cifra',
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

  Widget _buildCifraForm(int index, CifraFormData cifraForm) {
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
                  'Cifra ${index + 1}',
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
                        _model.removeCifraForm(index);
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
              controller: cifraForm.tituloController,
              focusNode: cifraForm.tituloFocusNode,
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
              controller: cifraForm.descripcionController,
              focusNode: cifraForm.descripcionFocusNode,
              decoration: _buildInputDecoration('Descripción'),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 6,
              minLines: 4,
              maxLength: 165,
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
}

