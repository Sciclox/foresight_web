import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'footer_desktop_model.dart';
export 'footer_desktop_model.dart';

class FooterDesktopWidget extends StatefulWidget {
  const FooterDesktopWidget({super.key});

  @override
  State<FooterDesktopWidget> createState() => _FooterDesktopWidgetState();
}

class _FooterDesktopWidgetState extends State<FooterDesktopWidget> {
  late FooterDesktopModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FooterDesktopModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: Color(0xFF0A0716),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-0.5, 0.0),
                child: ClipRect(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 3.0,
                      sigmaY: 3.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(56.0),
                      child: Image.asset(
                        'assets/images/fondocarrusel.png',
                        width: 565.0,
                        height: 354.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.5, 0.0),
                child: ClipRect(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 3.0,
                      sigmaY: 3.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(56.0),
                      child: Image.asset(
                        'assets/images/fondocarrusel.png',
                        width: 565.0,
                        height: 354.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(56.0),
                        child: Image.asset(
                          'assets/images/Reporte_1_Autoconstruccin.png',
                          width: 851.0,
                          height: 472.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 851.0,
                        height: 472.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.transparent, Color(0xD4000000)],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(56.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Reporte ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.anekLatin(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        _model.dropDownValue,
                                        '2025',
                                      ),
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.anekLatin(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Text(
                                'Futuros de la autoconstrucción',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.anekLatin(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 40.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                'Exploramos futuros para las familias autoconstructoras identificando señales de cambio y tendencias relevantes y las tradujimos en escenarios accionables y oportunidades de negocio.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.anekLatin(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        context
                                            .pushNamed(ReporteWidget.routeName);
                                      },
                                      text: 'Ir al reporte',
                                      icon: Icon(
                                        Icons.open_in_new,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconAlignment: IconAlignment.end,
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF9748FF),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.anekLatin(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(80.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Descargar',
                                      icon: Icon(
                                        Icons.file_download_outlined,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconAlignment: IconAlignment.end,
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x004B39EF),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.anekLatin(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(80.0),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 14.0,
                      height: 14.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 14.0,
                      height: 14.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 14.0,
                      height: 14.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 14.0,
                      height: 14.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF9748FF),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 14.0,
                      height: 14.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 14.0,
                      height: 14.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 14.0,
                      height: 14.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 14.0,
                      height: 14.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ].divide(SizedBox(width: 18.0)),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/blur-shadow_1_(2).png',
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.9, -0.7),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Año',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.anekLatin(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: Color(0x33FFFFFF),
                            offset: Offset(1.0, 0.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??= '2025',
                        ),
                        options: ['2025', '2026', '2027'],
                        onChanged: (val) =>
                            safeSetState(() => _model.dropDownValue = val),
                        width: 200.0,
                        height: 50.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.anekLatin(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                        hintText: '2025',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 24.0,
                        ),
                        fillColor: Color(0xFF0A0716),
                        elevation: 2.0,
                        borderColor: Color(0x55000000),
                        borderWidth: 0.0,
                        borderRadius: 80.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        hidesUnderline: true,
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                  ].divide(SizedBox(height: 17.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.9, 0.8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/image.webp',
                                width: 200.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/lacantera.png',
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.none,
                              ),
                            ),
                          ],
                        ),
                        Opacity(
                          opacity: 0.3,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 150.0, 0.0, 0.0),
                            child: Text(
                              'Copyright Cementos Pacasmayo S. A Copyright Cementos Pacasmayo S. A. - Todos los derechos reservados',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w200,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
