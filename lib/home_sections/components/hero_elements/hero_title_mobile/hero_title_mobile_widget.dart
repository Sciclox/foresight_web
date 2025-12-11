import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hero_title_mobile_model.dart';
export 'hero_title_mobile_model.dart';

class HeroTitleMobileWidget extends StatefulWidget {
  const HeroTitleMobileWidget({super.key});

  @override
  State<HeroTitleMobileWidget> createState() => _HeroTitleMobileWidgetState();
}

class _HeroTitleMobileWidgetState extends State<HeroTitleMobileWidget>
    with TickerProviderStateMixin {
  late HeroTitleMobileModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeroTitleMobileModel());

    animationsMap.addAll({
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
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'En',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.anekLatin(
                            fontWeight: FontWeight.w300,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return (MediaQuery.sizeOf(context).width * 0.068);
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return (MediaQuery.sizeOf(context).width *
                                  0.046875);
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return (MediaQuery.sizeOf(context).width *
                                  0.046875);
                            } else {
                              return (MediaQuery.sizeOf(context).width *
                                  0.046875);
                            }
                          }(),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
              Transform.translate(
                offset: Offset(MediaQuery.sizeOf(context).width * -0.011, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Foresight',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.anekLatin(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: () {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return (MediaQuery.sizeOf(context).width *
                                    0.225);
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return (MediaQuery.sizeOf(context).width *
                                    0.15625);
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return (MediaQuery.sizeOf(context).width *
                                    0.15625);
                              } else {
                                return (MediaQuery.sizeOf(context).width *
                                    0.15625);
                              }
                            }(),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
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
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.anekLatin(
                            fontWeight: FontWeight.w300,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: () {
                            if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return (MediaQuery.sizeOf(context).width * 0.068);
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return (MediaQuery.sizeOf(context).width *
                                  0.046875);
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return (MediaQuery.sizeOf(context).width *
                                  0.046875);
                            } else {
                              return (MediaQuery.sizeOf(context).width *
                                  0.046875);
                            }
                          }(),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ],
          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
