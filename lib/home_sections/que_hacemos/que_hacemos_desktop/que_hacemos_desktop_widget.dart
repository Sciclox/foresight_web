import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_sections/components/sphere/sphere_desktop/sphere_desktop_widget.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'que_hacemos_desktop_model.dart';
export 'que_hacemos_desktop_model.dart';

class QueHacemosDesktopWidget extends StatefulWidget {
  const QueHacemosDesktopWidget({
    super.key,
    required this.externalScrollController,
    this.onScrollProgressChanged,
  });

  final ScrollController externalScrollController;
  final ValueChanged<double>? onScrollProgressChanged;

  @override
  State<QueHacemosDesktopWidget> createState() =>
      _QueHacemosDesktopWidgetState();
}

class _QueHacemosDesktopWidgetState extends State<QueHacemosDesktopWidget> {
  late QueHacemosDesktopModel _model;
  final GlobalKey _sectionKey = GlobalKey();
  double _scrollProgress = 0.0;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QueHacemosDesktopModel());

    // Agregar listener al scroll controller externo
    widget.externalScrollController.addListener(_onScroll);

    // Calcular scrollProgress inicial
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateScrollProgress();
    });
  }

  @override
  void dispose() {
    widget.externalScrollController.removeListener(_onScroll);
    _model.maybeDispose();
    super.dispose();
  }

  void _onScroll() {
    _calculateScrollProgress();
  }

  void _calculateScrollProgress() {
    final RenderBox? renderBox =
        _sectionKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calcular cuando la sección entra al viewport
    final sectionTop = position.dy;
    final sectionBottom = position.dy + size.height;

    // 0.0 = la sección apenas empieza a entrar a la vista (top de la sección en el bottom del viewport)
    // 0.5 = la sección ya ocupa el 100% del viewport (top de la sección en el top del viewport)
    // 1.0 = se completó la segunda parte del scroll (bottom de la sección en el top del viewport)

    double progress = 0.0;

    // Calcular la distancia desde el top del viewport al top de la sección
    final distanceFromTop = sectionTop;

    if (distanceFromTop >= screenHeight) {
      // La sección aún no ha entrado al viewport
      progress = 0.0;
    } else if (distanceFromTop <= 0 && sectionBottom >= screenHeight) {
      // La sección llena completamente el viewport (de 0.5 a 1.0)
      // Calcular cuánto ha scrolleado dentro de la sección
      final scrollThroughSection =
          -distanceFromTop; // Distancia desde que empezó a llenar el viewport
      final maxScrollThroughSection =
          size.height - screenHeight; // Scroll máximo dentro de la sección

      if (maxScrollThroughSection > 0) {
        final phase2Progress =
            (scrollThroughSection / maxScrollThroughSection).clamp(0.0, 1.0);
        progress = 0.5 + (phase2Progress * 0.5);
      } else {
        progress = 0.5;
      }
    } else if (distanceFromTop > 0 && distanceFromTop < screenHeight) {
      // La sección está entrando al viewport (0.0 a 0.5)
      // Cuando sectionTop está en screenHeight, progress = 0.0
      // Cuando sectionTop está en 0, progress = 0.5
      progress = (1.0 - (distanceFromTop / screenHeight)) * 0.5;
    } else if (sectionBottom <= 0) {
      // La sección ya salió completamente
      progress = 1.0;
    } else {
      // Caso edge: la sección está parcialmente visible
      progress = _scrollProgress; // Mantener el progreso anterior
    }

    final clampedProgress = progress.clamp(0.0, 1.0);
    if ((clampedProgress - _scrollProgress).abs() > 0.001) {
      setState(() {
        _scrollProgress = clampedProgress;
      });
      // Notificar al padre sobre el cambio en scrollProgress
      widget.onScrollProgressChanged?.call(_scrollProgress);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    // Fase 1: scrollProgress 0.0 a 0.5 - Sphere centrada, sin movimiento
    // Fase 2: scrollProgress 0.5 a 1.0 - Sphere se mueve a la izquierda y reduce tamaño, texto entra

    double phase2Progress = 0.0;
    if (_scrollProgress > 0.5) {
      phase2Progress = ((_scrollProgress - 0.5) / 0.5).clamp(0.0, 1.0);
    }

    // Posición de la sphere (en términos de alignment)
    // Fase 1: centrada en el viewport (AlignmentDirectional(0.0, 0.0))
    // Fase 2: se mueve hacia la izquierda (AlignmentDirectional(-1.0, 0.0) con padding)
    final sphereWidth = scaleDesktop(700.0, context);
    const sphereCenterX = 0.0; // Centrada (alignment 0.0)
    final sphereLeftX = -1.0 +
        (sphereWidth / 2) /
            screenWidth; // A la izquierda, pero con espacio para la mitad de la sphere
    final sphereAlignmentX =
        ui.lerpDouble(sphereCenterX, sphereLeftX, phase2Progress) ?? 0.0;

    // Escala inicial de la sphere (1.0)
    const sphereInitialScale = 1.0;
    // Escala final de la sphere (ligeramente reducida, ej: 0.85)
    const sphereFinalScale = 0.85;
    final sphereScale =
        ui.lerpDouble(sphereInitialScale, sphereFinalScale, phase2Progress) ??
            1.0;

    // Posición del texto
    // Fase 1: completamente fuera por la derecha (textOffsetX = screenWidth)
    // Fase 2: entra gradualmente a su posición (textOffsetX = 0)
    final textInitialOffset = screenWidth; // Fuera del viewport por la derecha
    const textFinalOffset =
        0.0; // En su posición normal (alineado a la derecha)
    final textOffsetX =
        ui.lerpDouble(textInitialOffset, textFinalOffset, phase2Progress) ??
            textInitialOffset;

    // Opacidad del texto (0.0 en fase 1, 1.0 al final de fase 2)
    final textOpacity = phase2Progress;

    return Container(
      key: _sectionKey,
      width: double.infinity,
      height: screenHeight * 1.0,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          // Sphere con transformaciones basadas en scrollProgress
          Align(
            alignment: AlignmentDirectional(sphereAlignmentX, 0.0),
            child: Transform.scale(
              scale: sphereScale,
              child: wrapWithModel(
                model: _model.sphereDesktopModel,
                updateCallback: () => safeSetState(() {}),
                updateOnChange: true,
                child: const SphereDesktopWidget(),
              ),
            ),
          ),
          // Contenedor de texto con transformaciones basadas en scrollProgress
          Align(
            alignment: const AlignmentDirectional(1.0, 0.0),
            child: Transform.translate(
              offset: Offset(textOffsetX, 0.0),
              child: Opacity(
                opacity: textOpacity,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    0.0,
                    scaleDesktop(100.0, context),
                    0.0,
                  ),
                  child: Container(
                    width: scaleDesktop(649.0, context),
                    decoration: const BoxDecoration(),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '¿Qué hacemos?',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.anekLatin(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: scaleDesktop(100.0, context),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'Foresight Estratégico (F5) es el frente de La Cantera ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: scaleDesktop(30.0, context),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                  TextSpan(
                                    text:
                                        'desde donde exploramos futuros posibles para Cementos Pacasmayo.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: scaleDesktop(25.0, context),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Text(
                              'Identificamos señales de cambio, construimos escenarios y detectamos oportunidades de negocio, transformando la incertidumbre en decisiones estratégicas que fortalecen la organización para el futuro.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.anekLatin(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: scaleDesktop(28.0, context),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 32.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-1.0, 1.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/bg_ellipse_blur_2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
