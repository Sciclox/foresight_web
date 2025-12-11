import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  Widget _buildCard(BuildContext context, ReporteRecord reporte, double width,
      double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.network(reporte.imagenPortada).image,
        ),
        borderRadius: BorderRadius.circular(scaleDesktop(56.0, context)),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.transparent, Color(0xD4000000)],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
            borderRadius: BorderRadius.circular(scaleDesktop(56.0, context)),
          ),
          child: Padding(
            padding: EdgeInsets.all(scaleDesktop(24.0, context)),
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
                        text: reporte.enlaceDropdown,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.anekLatin(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: scaleDesktop(20.0, context),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.anekLatin(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: scaleDesktop(20.0, context),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0, 0.0, 0.0, scaleDesktop(16.0, context)),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          reporte.titulo,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.anekLatin(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: scaleDesktop(40.0, context),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  reporte.descripcion,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.anekLatin(
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: scaleDesktop(22.0, context),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0, scaleDesktop(16.0, context), 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: scaleDesktop(144.0, context),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(ReporteWidget.routeName);
                          },
                          text: 'Ir al reporte',
                          icon: Icon(
                            Icons.open_in_new,
                            size: scaleDesktop(15.0, context),
                          ),
                          options: FFButtonOptions(
                            height: scaleDesktop(40.0, context),
                            padding: EdgeInsetsDirectional.fromSTEB(
                                scaleDesktop(16.0, context),
                                0.0,
                                scaleDesktop(16.0, context),
                                0.0),
                            iconAlignment: IconAlignment.end,
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF9748FF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.anekLatin(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: scaleDesktop(16.0, context),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderSide:
                                BorderSide(width: scaleDesktop(1.0, context)),
                            borderRadius: BorderRadius.circular(
                                scaleDesktop(80.0, context)),
                          ),
                        ),
                      ),
                      SizedBox(width: scaleDesktop(16.0, context)),
                      SizedBox(
                        width: scaleDesktop(144.0, context),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await downloadFile(
                              filename: reporte.titulo,
                              url: reporte.urlDescargable,
                            );
                          },
                          text: 'Descargar',
                          icon: Icon(
                            Icons.file_download_outlined,
                            size: scaleDesktop(15.0, context),
                          ),
                          options: FFButtonOptions(
                            height: scaleDesktop(40.0, context),
                            padding: EdgeInsetsDirectional.fromSTEB(
                                scaleDesktop(16.0, context),
                                0.0,
                                scaleDesktop(16.0, context),
                                0.0),
                            iconAlignment: IconAlignment.end,
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0x004B39EF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.anekLatin(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: scaleDesktop(16.0, context),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: scaleDesktop(1.0, context),
                            ),
                            borderRadius: BorderRadius.circular(
                                scaleDesktop(80.0, context)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: const BoxDecoration(
        color: Color(0xFF0A0716),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(scaleDesktop(8.0, context)),
                child: Image.asset(
                  'assets/images/blur-shadow_1_(2).png',
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            scaleDesktopHeight(84.0, context),
                            0.0,
                            scaleDesktopHeight(38.0, context)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            StreamBuilder<List<ReporteRecord>>(
                              stream: queryReporteRecord(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: scaleDesktop(50.0, context),
                                      height: scaleDesktop(50.0, context),
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ReporteRecord> carouselReporteRecordList =
                                    snapshot.data!;

                                // Calcular índices para el bucle infinito
                                final currentIndex =
                                    _model.carouselCurrentIndex;
                                final totalItems =
                                    carouselReporteRecordList.length;
                                final leftIndex =
                                    (currentIndex - 1 + totalItems) %
                                        totalItems;
                                final rightIndex =
                                    (currentIndex + 1) % totalItems;

                                return SizedBox(
                                  width: scaleDesktop(851.0, context),
                                  height: scaleDesktop(472.0, context),
                                  child: Stack(
                                    alignment: AlignmentDirectional.center,
                                    clipBehavior: Clip.none,
                                    children: [
                                      // Reporte de la izquierda (atrás, muestra inicio - borde derecho)
                                      Positioned(
                                        left: scaleDesktop(-150.0, context),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              scaleDesktop(56.0, context)),
                                          child: SizedBox(
                                            width: scaleDesktop(400.0, context),
                                            height:
                                                scaleDesktop(472.0, context),
                                            child: OverflowBox(
                                              alignment: Alignment.centerRight,
                                              maxWidth:
                                                  scaleDesktop(851.0, context),
                                              child: ImageFiltered(
                                                imageFilter: ImageFilter.blur(
                                                  sigmaX: scaleDesktop(
                                                      3.0, context),
                                                  sigmaY: scaleDesktop(
                                                      3.0, context),
                                                ),
                                                child: _buildCard(
                                                  context,
                                                  carouselReporteRecordList[
                                                      leftIndex],
                                                  scaleDesktop(851.0, context),
                                                  scaleDesktop(472.0, context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Reporte de la derecha (atrás, muestra final - borde izquierdo)
                                      Positioned(
                                        right: scaleDesktop(-150.0, context),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              scaleDesktop(56.0, context)),
                                          child: SizedBox(
                                            width: scaleDesktop(400.0, context),
                                            height:
                                                scaleDesktop(472.0, context),
                                            child: OverflowBox(
                                              alignment: Alignment.centerLeft,
                                              maxWidth:
                                                  scaleDesktop(851.0, context),
                                              child: ImageFiltered(
                                                imageFilter: ImageFilter.blur(
                                                  sigmaX: scaleDesktop(
                                                      3.0, context),
                                                  sigmaY: scaleDesktop(
                                                      3.0, context),
                                                ),
                                                child: _buildCard(
                                                  context,
                                                  carouselReporteRecordList[
                                                      rightIndex],
                                                  scaleDesktop(851.0, context),
                                                  scaleDesktop(472.0, context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Reporte central (arriba, sin blur, más grande)
                                      Transform.scale(
                                        scale: 1.1,
                                        child: _buildCard(
                                          context,
                                          carouselReporteRecordList[
                                              currentIndex],
                                          scaleDesktop(851.0, context),
                                          scaleDesktop(472.0, context),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            // Controles de navegación
                            StreamBuilder<List<ReporteRecord>>(
                              stream: queryReporteRecord(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const SizedBox.shrink();
                                }
                                List<ReporteRecord> rowReporteRecordList =
                                    snapshot.data!;

                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0,
                                      scaleDesktopHeight(32.0, context),
                                      0.0,
                                      0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Botón anterior (siempre visible para bucle infinito)
                                      InkWell(
                                        onTap: () {
                                          safeSetState(() {
                                            _model.carouselCurrentIndex =
                                                (_model.carouselCurrentIndex -
                                                        1 +
                                                        rowReporteRecordList
                                                            .length) %
                                                    rowReporteRecordList.length;
                                          });
                                        },
                                        child: Icon(
                                          Icons.chevron_left,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: scaleDesktop(40.0, context),
                                        ),
                                      ),
                                      SizedBox(
                                          width: scaleDesktop(20.0, context)),
                                      // Indicadores
                                      ...List.generate(
                                          rowReporteRecordList.length,
                                          (rowIndex) {
                                        return Container(
                                          width: scaleDesktop(14.0, context),
                                          height: scaleDesktop(14.0, context),
                                          decoration: BoxDecoration(
                                            color: _model
                                                        .carouselCurrentIndex ==
                                                    rowIndex
                                                ? const Color(0xFF9748FF)
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            shape: BoxShape.circle,
                                          ),
                                        );
                                      }).divide(SizedBox(
                                          width: scaleDesktop(18.0, context))),
                                      SizedBox(
                                          width: scaleDesktop(20.0, context)),
                                      // Botón siguiente (siempre visible para bucle infinito)
                                      InkWell(
                                        onTap: () {
                                          safeSetState(() {
                                            _model.carouselCurrentIndex =
                                                (_model.carouselCurrentIndex +
                                                        1) %
                                                    rowReporteRecordList.length;
                                          });
                                        },
                                        child: Icon(
                                          Icons.chevron_right,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: scaleDesktop(40.0, context),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.9, -0.7),
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
                            fontSize: scaleDesktop(20.0, context),
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
                            blurRadius: scaleDesktop(1.0, context),
                            color: const Color(0x33FFFFFF),
                            offset: Offset(scaleDesktop(1.0, context), 0.0),
                          )
                        ],
                        borderRadius:
                            BorderRadius.circular(scaleDesktop(28.0, context)),
                      ),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??= '2025',
                        ),
                        options: const ['2025', '2026', '2027'],
                        onChanged: (val) =>
                            safeSetState(() => _model.dropDownValue = val),
                        width: scaleDesktop(200.0, context),
                        height: scaleDesktop(50.0, context),
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
                                  fontSize: scaleDesktop(20.0, context),
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
                          size: scaleDesktop(24.0, context),
                        ),
                        fillColor: const Color(0xFF0A0716),
                        elevation: scaleDesktop(2.0, context),
                        borderColor: const Color(0x55000000),
                        borderWidth: scaleDesktop(1.0, context),
                        borderRadius: scaleDesktop(28.0, context),
                        margin: EdgeInsetsDirectional.fromSTEB(
                            scaleDesktop(12.0, context),
                            0.0,
                            scaleDesktop(12.0, context),
                            0.0),
                        hidesUnderline: true,
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                  ].divide(SizedBox(height: scaleDesktopHeight(17.0, context))),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.9, 0.95),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  scaleDesktop(8.0, context)),
                              child: Image.asset(
                                'assets/images/image.webp',
                                width: scaleDesktop(200.0, context),
                                fit: BoxFit.contain,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  scaleDesktop(8.0, context)),
                              child: Image.asset(
                                'assets/images/lacantera.png',
                                width: scaleDesktop(200.0, context),
                                height: scaleDesktop(200.0, context),
                                fit: BoxFit.none,
                              ),
                            ),
                          ],
                        ),
                        Opacity(
                          opacity: 0.3,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                scaleDesktop(20.0, context),
                                scaleDesktop(150.0, context),
                                0.0,
                                0.0),
                            child: Text(
                              'Copyright Cementos Pacasmayo S. A Copyright Cementos Pacasmayo S. A. - Todos los derechos reservados',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: scaleDesktop(16.0, context),
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
