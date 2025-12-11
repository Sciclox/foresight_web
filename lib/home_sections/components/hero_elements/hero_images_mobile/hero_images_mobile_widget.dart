import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'hero_images_mobile_model.dart';
export 'hero_images_mobile_model.dart';

class HeroImagesMobileWidget extends StatefulWidget {
  const HeroImagesMobileWidget({super.key});

  @override
  State<HeroImagesMobileWidget> createState() => _HeroImagesMobileWidgetState();
}

class _HeroImagesMobileWidgetState extends State<HeroImagesMobileWidget>
    with TickerProviderStateMixin {
  late HeroImagesMobileModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeroImagesMobileModel());

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

    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Container(
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MouseRegion(
              opaque: false,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered1 = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered1 = false);
              }),
              child: AnimatedOpacity(
                opacity: FFAppState().image1 == true ? 0.6 : 0.35,
                duration: 300.0.ms,
                curve: Curves.easeInOut,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      0.0,
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.0740741,
                        0.0,
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(valueOrDefault<double>(
                      () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return ((MediaQuery.sizeOf(context).width * 0.24318) *
                              0.5);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return (MediaQuery.sizeOf(context).width * 0.078125);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return (MediaQuery.sizeOf(context).width * 0.078125);
                        } else {
                          return (MediaQuery.sizeOf(context).width * 0.078125);
                        }
                      }(),
                      0.0,
                    )),
                    child: Image.asset(
                      'assets/images/images1.png',
                      width: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return (MediaQuery.sizeOf(context).width * 0.24318);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return (MediaQuery.sizeOf(context).width * 0.11146);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return (MediaQuery.sizeOf(context).width * 0.11146);
                        } else {
                          return (MediaQuery.sizeOf(context).width * 0.11146);
                        }
                      }(),
                      height: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return (MediaQuery.sizeOf(context).height * 0.28723);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return (MediaQuery.sizeOf(context).height * 0.50926);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return (MediaQuery.sizeOf(context).height * 0.50926);
                        } else {
                          return (MediaQuery.sizeOf(context).height * 0.50926);
                        }
                      }(),
                      fit: BoxFit.cover,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation1']!),
                ),
              ),
            ),
            Opacity(
              opacity: 0.35,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 77.0),
                child: Container(
                  width: 1.0,
                  height: 352.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                ),
              ),
            ),
            MouseRegion(
              opaque: false,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered2 = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered2 = false);
              }),
              child: AnimatedOpacity(
                opacity: FFAppState().image2 == true ? 0.6 : 0.35,
                duration: 300.0.ms,
                curve: Curves.easeInOut,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      0.0,
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.194444,
                        0.0,
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(valueOrDefault<double>(
                      () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return ((MediaQuery.sizeOf(context).width * 0.24318) *
                              0.5);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return (MediaQuery.sizeOf(context).width * 0.078125);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return (MediaQuery.sizeOf(context).width * 0.078125);
                        } else {
                          return (MediaQuery.sizeOf(context).width * 0.078125);
                        }
                      }(),
                      0.0,
                    )),
                    child: Image.asset(
                      'assets/images/images2.png',
                      width: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return (MediaQuery.sizeOf(context).width * 0.24318);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return (MediaQuery.sizeOf(context).width * 0.11146);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return (MediaQuery.sizeOf(context).width * 0.11146);
                        } else {
                          return (MediaQuery.sizeOf(context).width * 0.11146);
                        }
                      }(),
                      height: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return (MediaQuery.sizeOf(context).height * 0.28723);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return (MediaQuery.sizeOf(context).height * 0.50926);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return (MediaQuery.sizeOf(context).height * 0.50926);
                        } else {
                          return (MediaQuery.sizeOf(context).height * 0.50926);
                        }
                      }(),
                      fit: BoxFit.cover,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                ),
              ),
            ),
            Opacity(
              opacity: 0.35,
              child: Container(
                width: 1.0,
                height: 352.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
            ),
            MouseRegion(
              opaque: false,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered3 = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered3 = false);
              }),
              child: AnimatedOpacity(
                opacity: FFAppState().image3 == true ? 0.6 : 0.35,
                duration: 300.0.ms,
                curve: Curves.easeInOut,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.092593,
                        0.0,
                      ),
                      0.0,
                      0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(valueOrDefault<double>(
                      () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return ((MediaQuery.sizeOf(context).width * 0.24318) *
                              0.5);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return (MediaQuery.sizeOf(context).width * 0.078125);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return (MediaQuery.sizeOf(context).width * 0.078125);
                        } else {
                          return (MediaQuery.sizeOf(context).width * 0.078125);
                        }
                      }(),
                      0.0,
                    )),
                    child: Image.asset(
                      'assets/images/images3.png',
                      width: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return (MediaQuery.sizeOf(context).width * 0.24318);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return (MediaQuery.sizeOf(context).width * 0.11146);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return (MediaQuery.sizeOf(context).width * 0.11146);
                        } else {
                          return (MediaQuery.sizeOf(context).width * 0.11146);
                        }
                      }(),
                      height: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return (MediaQuery.sizeOf(context).height * 0.28723);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return (MediaQuery.sizeOf(context).height * 0.50926);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return (MediaQuery.sizeOf(context).height * 0.50926);
                        } else {
                          return (MediaQuery.sizeOf(context).height * 0.50926);
                        }
                      }(),
                      fit: BoxFit.cover,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation3']!),
                ),
              ),
            ),
            Opacity(
              opacity: 0.35,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
                child: Container(
                  width: 1.0,
                  height: 352.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
            ),
            MouseRegion(
              opaque: false,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered4 = true);
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered4 = false);
              }),
              child: AnimatedOpacity(
                opacity: FFAppState().image4 ? 0.6 : 0.35,
                duration: 300.0.ms,
                curve: Curves.easeInOut,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      0.0,
                      0.0,
                      valueOrDefault<double>(
                        MediaQuery.sizeOf(context).height * 0.06,
                        0.0,
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(valueOrDefault<double>(
                      () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return ((MediaQuery.sizeOf(context).width * 0.24318) *
                              0.5);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return (MediaQuery.sizeOf(context).width * 0.078125);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return (MediaQuery.sizeOf(context).width * 0.078125);
                        } else {
                          return (MediaQuery.sizeOf(context).width * 0.078125);
                        }
                      }(),
                      0.0,
                    )),
                    child: Image.asset(
                      'assets/images/images4.png',
                      width: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return (MediaQuery.sizeOf(context).width * 0.24318);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return (MediaQuery.sizeOf(context).width * 0.11146);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return (MediaQuery.sizeOf(context).width * 0.11146);
                        } else {
                          return (MediaQuery.sizeOf(context).width * 0.11146);
                        }
                      }(),
                      height: () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return (MediaQuery.sizeOf(context).height * 0.28723);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return (MediaQuery.sizeOf(context).height * 0.50926);
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return (MediaQuery.sizeOf(context).height * 0.50926);
                        } else {
                          return (MediaQuery.sizeOf(context).height * 0.50926);
                        }
                      }(),
                      fit: BoxFit.cover,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation4']!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
