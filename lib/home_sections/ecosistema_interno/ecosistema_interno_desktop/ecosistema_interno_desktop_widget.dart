import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_sections/components/triangle/triangle_desktop/triangle_desktop_widget.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ecosistema_interno_desktop_model.dart';
export 'ecosistema_interno_desktop_model.dart';

class EcosistemaInternoDesktopWidget extends StatefulWidget {
  const EcosistemaInternoDesktopWidget({super.key});

  @override
  State<EcosistemaInternoDesktopWidget> createState() =>
      _EcosistemaInternoDesktopWidgetState();
}

class _EcosistemaInternoDesktopWidgetState
    extends State<EcosistemaInternoDesktopWidget>
    with TickerProviderStateMixin {
  late EcosistemaInternoDesktopModel _model;

  final animationsMap = <String, AnimationInfo>{};

  // Factor de escala para hacer el componente más pequeño (0.75 = 75% del tamaño)
  static const double scaleFactor = 0.75;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EcosistemaInternoDesktopModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, scaleDesktop(54.0, context) * scaleFactor),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, scaleDesktop(54.0, context) * scaleFactor),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, scaleDesktop(54.0, context) * scaleFactor),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

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
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Opacity(
                opacity: (_model.triangleDesktopModel.mouse1Hovered == true) ||
                        (_model.triangleDesktopModel.mouse2Hovered == true) ||
                        (_model.triangleDesktopModel.mouse3Hovered == true)
                    ? 0.02
                    : 1.0,
                child: Container(
                  width: scaleDesktop(650.0, context) * scaleFactor,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ecosistema interno',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.anekLatin(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: scaleDesktop(100.0, context) * scaleFactor,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Text(
                        'El frente de Foresight Estratégico se desarrolla de manera transversal a la organización e interactúa con distintos actores. Cada uno de nuestros vectores (retador, relevante y concreto) es pertinente para cada tipo de actor, a los cuales están dirigidos entregables específicos que condensan información y alimentan la toma de decisiones:',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.anekLatin(
                                fontWeight: FontWeight.w300,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: scaleDesktop(28.0, context) * scaleFactor,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ].divide(SizedBox(height: scaleDesktop(32.0, context) * scaleFactor)),
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.triangleDesktopModel,
                updateCallback: () => safeSetState(() {}),
                updateOnChange: true,
                child: const TriangleDesktopWidget(),
              ),
            ],
          ),
          if (_model.triangleDesktopModel.mouse1Hovered == true)
            AnimatedOpacity(
              opacity:
                  _model.triangleDesktopModel.mouse1Hovered == true ? 1.0 : 0.0,
              duration: 300.0.ms,
              curve: Curves.easeInOut,
              child: Align(
                alignment: const AlignmentDirectional(-0.45, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: scaleDesktop(580.0, context) * scaleFactor,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0x8C0F0B1F), Color(0x8C140648)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(scaleDesktop(30.0, context) * scaleFactor),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            scaleDesktop(24.0, context) * scaleFactor, scaleDesktop(16.0, context) * scaleFactor, scaleDesktop(24.0, context) * scaleFactor, scaleDesktop(16.0, context) * scaleFactor),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Relación: F5 con C-Level',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.anekLatin(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: const Color(0xFF00EAFF),
                                    fontSize: scaleDesktop(30.0, context) * scaleFactor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              'F5 establece espacios de conversación con CEO y directores retadores, donde se presentan tendencias de negocio, tecnología, innovación y habitabilidad.',
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
                                    fontSize: scaleDesktop(28.0, context) * scaleFactor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: scaleDesktop(580.0, context) * scaleFactor,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0x8C0F0B1F), Color(0x8C140648)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(scaleDesktop(30.0, context) * scaleFactor),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            scaleDesktop(24.0, context) * scaleFactor, scaleDesktop(16.0, context) * scaleFactor, scaleDesktop(24.0, context) * scaleFactor, scaleDesktop(16.0, context) * scaleFactor),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Entregable: Trend Deck',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.anekLatin(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: scaleDesktop(30.0, context) * scaleFactor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              'Documentos que reúnen señales y tendencias clave para la industria, mostrando innovaciones emergentes y oportunidades estratégicas derivadas de foros y espacios de diseño, tecnología e innovación.',
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
                                    fontSize: scaleDesktop(28.0, context) * scaleFactor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: scaleDesktop(24.0, context) * scaleFactor)),
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation1']!),
              ),
            ),
          if (_model.triangleDesktopModel.mouse2Hovered == true)
            Opacity(
              opacity:
                  _model.triangleDesktopModel.mouse2Hovered == true ? 1.0 : 0.0,
              child: Align(
                alignment: const AlignmentDirectional(-0.45, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: scaleDesktop(580.0, context) * scaleFactor,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0x8C0F0B1F), Color(0x8C140648)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(scaleDesktop(30.0, context) * scaleFactor),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            scaleDesktop(24.0, context) * scaleFactor, scaleDesktop(16.0, context) * scaleFactor, scaleDesktop(24.0, context) * scaleFactor, scaleDesktop(16.0, context) * scaleFactor),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Relación: F5 con la organización',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.anekLatin(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: const Color(0xFF00EAFF),
                                    fontSize: scaleDesktop(30.0, context) * scaleFactor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              'F5 se conecta con directores y líderes mediante la construcción de escenarios sobre futuros posibles y relevantes. A partir de un reto co-creado y alineado, se impulsan conversaciones estratégicas que orientan la acción.',
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
                                    fontSize: scaleDesktop(28.0, context) * scaleFactor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: scaleDesktop(580.0, context) * scaleFactor,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0x8C0F0B1F), Color(0x8C140648)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(scaleDesktop(30.0, context) * scaleFactor),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            scaleDesktop(24.0, context) * scaleFactor, scaleDesktop(16.0, context) * scaleFactor, scaleDesktop(24.0, context) * scaleFactor, scaleDesktop(16.0, context) * scaleFactor),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Entregable: Escenarios Futuros',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.anekLatin(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: scaleDesktop(30.0, context) * scaleFactor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              'Narrativas que amplían la mirada más allá del corto plazo. Se construyen a partir de tendencias e incertidumbres clave. No predicen, sino que ayudan a imaginar futuros y activar iniciativas que fortalezcan a la organización.',
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
                                    fontSize: scaleDesktop(28.0, context) * scaleFactor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: scaleDesktop(24.0, context) * scaleFactor)),
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation2']!),
              ),
            ),
          if (_model.triangleDesktopModel.mouse3Hovered == true)
            Opacity(
              opacity:
                  _model.triangleDesktopModel.mouse3Hovered == true ? 1.0 : 0.0,
              child: Align(
                alignment: const AlignmentDirectional(-0.45, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: scaleDesktop(580.0, context) * scaleFactor,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0x8C0F0B1F), Color(0x8C140648)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(scaleDesktop(30.0, context) * scaleFactor),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            scaleDesktop(24.0, context) * scaleFactor, scaleDesktop(16.0, context) * scaleFactor, scaleDesktop(24.0, context) * scaleFactor, scaleDesktop(16.0, context) * scaleFactor),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Relación: F5 con la Cantera',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.anekLatin(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: const Color(0xFF00EAFF),
                                    fontSize: scaleDesktop(30.0, context) * scaleFactor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              'F5 se articula con la organización para activar iniciativas y convertirlas en acciones concretas. Bajo un esquema liderado por una directora, se movilizan los equipos de Innovación, Transformación Digital o Task Force según el tipo de desafío.',
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
                                    fontSize: scaleDesktop(28.0, context) * scaleFactor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: scaleDesktop(580.0, context) * scaleFactor,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0x8C0F0B1F), Color(0x8C140648)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(scaleDesktop(30.0, context) * scaleFactor),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            scaleDesktop(24.0, context) * scaleFactor, scaleDesktop(16.0, context) * scaleFactor, scaleDesktop(24.0, context) * scaleFactor, scaleDesktop(16.0, context) * scaleFactor),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Entregable: Briefs',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.anekLatin(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: scaleDesktop(30.0, context) * scaleFactor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              'Documentos que alinean expectativas y esfuerzos de los equipos para ejecutar iniciativas derivadas de los escenarios. Reúnen información clave y se elaboran junto a los líderes que las impulsarán dentro de la organización.',
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
                                    fontSize: scaleDesktop(28.0, context) * scaleFactor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: scaleDesktop(24.0, context) * scaleFactor)),
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation3']!),
              ),
            ),
          Opacity(
            opacity: 0.2,
            child: Align(
              alignment: const AlignmentDirectional(-1.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Vector.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
