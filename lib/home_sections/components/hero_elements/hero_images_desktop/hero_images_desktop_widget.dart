import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'hero_images_desktop_model.dart';
export 'hero_images_desktop_model.dart';

class HeroImagesDesktopWidget extends StatefulWidget {
  const HeroImagesDesktopWidget({super.key});

  @override
  State<HeroImagesDesktopWidget> createState() =>
      _HeroImagesDesktopWidgetState();
}

class _HeroImagesDesktopWidgetState extends State<HeroImagesDesktopWidget>
    with TickerProviderStateMixin {
  late HeroImagesDesktopModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeroImagesDesktopModel());

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
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedOpacity(
              opacity: FFAppState().image1 == true ? 0.6 : 0.35,
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
                  borderRadius: BorderRadius.circular(valueOrDefault<double>(
                    () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                    width: MediaQuery.sizeOf(context).width * 0.11146,
                    height: MediaQuery.sizeOf(context).height * 0.46296,
                    fit: BoxFit.cover,
                  ),
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation1']!),
              ),
            ),
            Opacity(
              opacity: 0.35,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 77.0),
                child: Container(
                  width: 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.60556,
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
            AnimatedOpacity(
              opacity: FFAppState().image2 == true ? 0.6 : 0.35,
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
                  borderRadius: BorderRadius.circular(valueOrDefault<double>(
                    () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                    width: MediaQuery.sizeOf(context).width * 0.11146,
                    height: MediaQuery.sizeOf(context).height * 0.46296,
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
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: FFAppState().image3 == true ? 0.6 : 0.35,
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
                  borderRadius: BorderRadius.circular(valueOrDefault<double>(
                    () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                    width: MediaQuery.sizeOf(context).width * 0.11146,
                    height: MediaQuery.sizeOf(context).height * 0.46296,
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
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: FFAppState().image4 ? 0.6 : 0.35,
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
                  borderRadius: BorderRadius.circular(valueOrDefault<double>(
                    () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                    width: MediaQuery.sizeOf(context).width * 0.11146,
                    height: MediaQuery.sizeOf(context).height * 0.46296,
                    fit: BoxFit.cover,
                  ),
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation4']!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
