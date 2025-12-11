import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'hero_desktop_model.dart';
export 'hero_desktop_model.dart';

class HeroDesktopWidget extends StatefulWidget {
  const HeroDesktopWidget({super.key});

  @override
  State<HeroDesktopWidget> createState() => _HeroDesktopWidgetState();
}

class _HeroDesktopWidgetState extends State<HeroDesktopWidget>
    with TickerProviderStateMixin {
  late HeroDesktopModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeroDesktopModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, MediaQuery.sizeOf(context).height),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -MediaQuery.sizeOf(context).height),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, MediaQuery.sizeOf(context).height),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -MediaQuery.sizeOf(context).height),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(MediaQuery.sizeOf(context).width, 0.0),
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
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: const BoxDecoration(),
      child: Align(
        alignment: const AlignmentDirectional(0.0, -1.0),
        child: Stack(
          alignment: const AlignmentDirectional(0.0, 1.0),
          children: [
            Lottie.asset(
              'assets/jsons/mouseScroll2s.json',
              width: MediaQuery.sizeOf(context).width * 0.03333,
              height: MediaQuery.sizeOf(context).width * 0.12727,
              fit: BoxFit.contain,
              animate: true,
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
                child: SvgPicture.asset(
                  'assets/images/bg_ellipse_blur_1_(1).png',
                  width: scaleDesktop(1607.0, context),
                  height: scaleDesktopHeight(762.0, context),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Opacity(
              opacity: 0.5,
              child: Align(
                alignment: const AlignmentDirectional(0.6, -0.3),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedOpacity(
                        opacity: FFAppState().image1 == true ? 1.0 : 0.35,
                        duration: 300.0.ms,
                        curve: Curves.easeInOut,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.14259,
                                0.0,
                              ),
                              0.0,
                              0.0),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(valueOrDefault<double>(
                              () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return ((MediaQuery.sizeOf(context).width *
                                          0.24318) *
                                      0.5);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.078125);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.078125);
                                } else {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.078125);
                                }
                              }(),
                              0.0,
                            )),
                            child: Image.asset(
                              'assets/images/images1.png',
                              width: MediaQuery.sizeOf(context).width * 0.11146,
                              height:
                                  MediaQuery.sizeOf(context).height * 0.46296,
                              fit: BoxFit.cover,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['imageOnPageLoadAnimation1']!),
                        ),
                      ),
                      Opacity(
                        opacity: 0.35,
                        child: Container(
                          width: 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.60556,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: FFAppState().image2 == true ? 1.0 : 0.35,
                        duration: 300.0.ms,
                        curve: Curves.easeInOut,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.07963,
                                0.0,
                              ),
                              0.0,
                              0.0),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(valueOrDefault<double>(
                              () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return ((MediaQuery.sizeOf(context).width *
                                          0.24318) *
                                      0.5);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.078125);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.078125);
                                } else {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.078125);
                                }
                              }(),
                              0.0,
                            )),
                            child: Image.asset(
                              'assets/images/images2.png',
                              width: MediaQuery.sizeOf(context).width * 0.11146,
                              height:
                                  MediaQuery.sizeOf(context).height * 0.46296,
                              fit: BoxFit.cover,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['imageOnPageLoadAnimation2']!),
                        ),
                      ),
                      Opacity(
                        opacity: 0.35,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.07685,
                                0.0,
                              ),
                              0.0,
                              0.0),
                          child: Container(
                            width: 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.60556,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: FFAppState().image3 == true ? 1.0 : 0.35,
                        duration: 300.0.ms,
                        curve: Curves.easeInOut,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.21944,
                                0.0,
                              ),
                              0.0,
                              0.0),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(valueOrDefault<double>(
                              () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return ((MediaQuery.sizeOf(context).width *
                                          0.24318) *
                                      0.5);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.078125);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.078125);
                                } else {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.078125);
                                }
                              }(),
                              0.0,
                            )),
                            child: Image.asset(
                              'assets/images/images3.png',
                              width: MediaQuery.sizeOf(context).width * 0.11146,
                              height:
                                  MediaQuery.sizeOf(context).height * 0.46296,
                              fit: BoxFit.cover,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['imageOnPageLoadAnimation3']!),
                        ),
                      ),
                      Opacity(
                        opacity: 0.35,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.15093,
                                0.0,
                              ),
                              0.0,
                              0.0),
                          child: Container(
                            width: 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.60556,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: FFAppState().image4 ? 1.0 : 0.35,
                        duration: 300.0.ms,
                        curve: Curves.easeInOut,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.15093,
                                0.0,
                              ),
                              0.0,
                              0.0),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(valueOrDefault<double>(
                              () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return ((MediaQuery.sizeOf(context).width *
                                          0.24318) *
                                      0.5);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.078125);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.078125);
                                } else {
                                  return (MediaQuery.sizeOf(context).width *
                                      0.078125);
                                }
                              }(),
                              0.0,
                            )),
                            child: Image.asset(
                              'assets/images/images4.png',
                              width: MediaQuery.sizeOf(context).width * 0.11146,
                              height:
                                  MediaQuery.sizeOf(context).height * 0.46296,
                              fit: BoxFit.cover,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['imageOnPageLoadAnimation4']!),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      10.0, 0.0, 10.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'En',
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
                                  fontSize: MediaQuery.sizeOf(context).width *
                                      0.046875,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                      Transform.translate(
                        offset: Offset(
                            MediaQuery.sizeOf(context).width * -0.011, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Foresight',
                              textAlign: TextAlign.start,
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
                                    fontSize: MediaQuery.sizeOf(context).width *
                                        0.15625,
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'construimos futuros habitables',
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
                                  fontSize: MediaQuery.sizeOf(context).width *
                                      0.046875,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!),
                ),
              ),
            ),
            // ------------------ Capa invisible con MouseRegion (replica la lógica de opacidad) ------------------
            // Esta capa debe estar al final para estar por encima de todo y capturar los eventos del mouse
            Align(
              alignment: const AlignmentDirectional(0.6, -0.3),
              child: Opacity(
                // la capa es totalmente invisible (0.0) pero captura eventos del mouse
                opacity: 0.0,
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hitbox para imagen 1 (misma padding/offset que la imagen real)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.14259,
                            0.0,
                          ),
                          0.0,
                          0.0,
                        ),
                        child: MouseRegion(
                          onEnter: (_) =>
                              setState(() => FFAppState().update(() {
                                    FFAppState().image1 = true;
                                  })),
                          onExit: (_) => setState(() => FFAppState().update(() {
                                FFAppState().image1 = false;
                              })),
                          cursor: SystemMouseCursors.click,
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.11146,
                            height: MediaQuery.sizeOf(context).height * 0.46296,
                            // puedes usar Container vacío para definir la hitbox
                            child: Container(),
                          ),
                        ),
                      ),
                      // separador (igual alto que el separador visible)
                      Padding(
                        padding: EdgeInsets.zero,
                        child: SizedBox(
                          width: 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.60556,
                        ),
                      ),
                      // Hitbox para imagen 2
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.07963,
                            0.0,
                          ),
                          0.0,
                          0.0,
                        ),
                        child: MouseRegion(
                          onEnter: (_) =>
                              setState(() => FFAppState().update(() {
                                    FFAppState().image2 = true;
                                  })),
                          onExit: (_) => setState(() => FFAppState().update(() {
                                FFAppState().image2 = false;
                              })),
                          cursor: SystemMouseCursors.click,
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.11146,
                            height: MediaQuery.sizeOf(context).height * 0.46296,
                            child: Container(),
                          ),
                        ),
                      ),
                      // separador
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.07685,
                            0.0,
                          ),
                          0.0,
                          0.0,
                        ),
                        child: SizedBox(
                          width: 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.60556,
                        ),
                      ),
                      // Hitbox para imagen 3
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.21944,
                            0.0,
                          ),
                          0.0,
                          0.0,
                        ),
                        child: MouseRegion(
                          onEnter: (_) =>
                              setState(() => FFAppState().update(() {
                                    FFAppState().image3 = true;
                                  })),
                          onExit: (_) => setState(() => FFAppState().update(() {
                                FFAppState().image3 = false;
                              })),
                          cursor: SystemMouseCursors.click,
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.11146,
                            height: MediaQuery.sizeOf(context).height * 0.46296,
                            child: Container(),
                          ),
                        ),
                      ),
                      // separador
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.15093,
                            0.0,
                          ),
                          0.0,
                          0.0,
                        ),
                        child: SizedBox(
                          width: 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.60556,
                        ),
                      ),
                      // Hitbox para imagen 4
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).height * 0.15093,
                            0.0,
                          ),
                          0.0,
                          0.0,
                        ),
                        child: MouseRegion(
                          onEnter: (_) =>
                              setState(() => FFAppState().update(() {
                                    FFAppState().image4 = true;
                                  })),
                          onExit: (_) => setState(() => FFAppState().update(() {
                                FFAppState().image4 = false;
                              })),
                          cursor: SystemMouseCursors.click,
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.11146,
                            height: MediaQuery.sizeOf(context).height * 0.46296,
                            child: Container(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // ----------------------------------------------------------------------------------------------------
          ],
        ),
      ),
    );
  }
}
