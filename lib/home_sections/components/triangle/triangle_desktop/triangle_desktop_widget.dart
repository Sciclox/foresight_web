import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'triangle_desktop_model.dart';
export 'triangle_desktop_model.dart';

class TriangleDesktopWidget extends StatefulWidget {
  const TriangleDesktopWidget({super.key});

  @override
  State<TriangleDesktopWidget> createState() => _TriangleDesktopWidgetState();
}

class _TriangleDesktopWidgetState extends State<TriangleDesktopWidget>
    with TickerProviderStateMixin {
  late TriangleDesktopModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TriangleDesktopModel());

    animationsMap.addAll({
      'textOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(-20.0, -12.0),
          ),
        ],
      ),
      'textOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(-20.0, 0.0),
          ),
        ],
      ),
      'textOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(20.0, -12.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: Image.asset(
              'assets/images/shine02.png',
            ).image,
          ),
        ),
        child: Container(
          width: 841.0,
          height: 800.0,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.04, -0.84),
                child: Container(
                  decoration: BoxDecoration(),
                  child: MouseRegion(
                    opaque: false,
                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                    child: Stack(
                      children: [
                        if ((_model.mouse3Hovered == false) &&
                            (_model.mouse2Hovered == false) &&
                            (_model.mouse1Hovered == false))
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Triangle_up.png',
                              width: 408.0,
                              height: 355.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        Opacity(
                          opacity: _model.mouse1Hovered == true ? 1.0 : 0.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/State=Default.png',
                              width: 408.0,
                              height: 355.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: (_model.mouse2Hovered == true) ||
                                  (_model.mouse3Hovered == true)
                              ? 0.0
                              : 1.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/triangle_1_(1).png',
                              width: 408.0,
                              height: 355.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onEnter: ((event) async {
                      safeSetState(() => _model.mouse1Hovered = true);
                      await Future.wait([
                        Future(() async {
                          if (animationsMap['textOnActionTriggerAnimation1'] !=
                              null) {
                            await animationsMap[
                                    'textOnActionTriggerAnimation1']!
                                .controller
                                .forward(from: 0.0);
                          }
                        }),
                        Future(() async {
                          if (animationsMap['textOnActionTriggerAnimation2'] !=
                              null) {
                            await animationsMap[
                                    'textOnActionTriggerAnimation2']!
                                .controller
                                .forward(from: 0.0);
                          }
                        }),
                        Future(() async {
                          if (animationsMap['textOnActionTriggerAnimation3'] !=
                              null) {
                            await animationsMap[
                                    'textOnActionTriggerAnimation3']!
                                .controller
                                .forward(from: 0.0);
                          }
                        }),
                      ]);
                    }),
                    onExit: ((event) async {
                      safeSetState(() => _model.mouse1Hovered = false);
                    }),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.92, 0.75),
                child: MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  child: Stack(
                    children: [
                      if ((_model.mouse3Hovered == false) &&
                          (_model.mouse2Hovered == false) &&
                          (_model.mouse1Hovered == false))
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Triangle_2_(2).png',
                            width: 387.0,
                            height: 336.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      Opacity(
                        opacity: _model.mouse2Hovered == true ? 1.0 : 0.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/State=Default_(1).png',
                            width: 387.0,
                            height: 336.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: (_model.mouse1Hovered == true) ||
                                (_model.mouse3Hovered == true)
                            ? 1.0
                            : 0.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Triangle_2_(3).png',
                            width: 387.0,
                            height: 336.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onEnter: ((event) async {
                    safeSetState(() => _model.mouse2Hovered = true);
                    await Future.wait([
                      Future(() async {
                        if (animationsMap['textOnActionTriggerAnimation1'] !=
                            null) {
                          await animationsMap['textOnActionTriggerAnimation1']!
                              .controller
                              .forward(from: 0.0);
                        }
                      }),
                      Future(() async {
                        if (animationsMap['textOnActionTriggerAnimation2'] !=
                            null) {
                          await animationsMap['textOnActionTriggerAnimation2']!
                              .controller
                              .forward(from: 0.0);
                        }
                      }),
                      Future(() async {
                        if (animationsMap['textOnActionTriggerAnimation3'] !=
                            null) {
                          await animationsMap['textOnActionTriggerAnimation3']!
                              .controller
                              .forward(from: 0.0);
                        }
                      }),
                    ]);
                  }),
                  onExit: ((event) async {
                    safeSetState(() => _model.mouse2Hovered = false);
                  }),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.03, 0.74),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/triangle_2_(1).png',
                    width: 387.0,
                    height: 336.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.78),
                child: MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  child: Stack(
                    children: [
                      if ((_model.mouse3Hovered == false) &&
                          (_model.mouse2Hovered == false) &&
                          (_model.mouse1Hovered == false))
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/triangle_3.png',
                            width: 387.0,
                            height: 337.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      Opacity(
                        opacity: _model.mouse3Hovered == true ? 1.0 : 0.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/State=Default_(2).png',
                            width: 387.0,
                            height: 337.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: (_model.mouse1Hovered == true) ||
                                (_model.mouse2Hovered == true)
                            ? 1.0
                            : 0.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/triangle_3_(1).png',
                            width: 387.0,
                            height: 337.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onEnter: ((event) async {
                    safeSetState(() => _model.mouse3Hovered = true);
                    await Future.wait([
                      Future(() async {
                        if (animationsMap['textOnActionTriggerAnimation1'] !=
                            null) {
                          await animationsMap['textOnActionTriggerAnimation1']!
                              .controller
                              .forward(from: 0.0);
                        }
                      }),
                      Future(() async {
                        if (animationsMap['textOnActionTriggerAnimation2'] !=
                            null) {
                          await animationsMap['textOnActionTriggerAnimation2']!
                              .controller
                              .forward(from: 0.0);
                        }
                      }),
                      Future(() async {
                        if (animationsMap['textOnActionTriggerAnimation3'] !=
                            null) {
                          await animationsMap['textOnActionTriggerAnimation3']!
                              .controller
                              .forward(from: 0.0);
                        }
                      }),
                    ]);
                  }),
                  onExit: ((event) async {
                    safeSetState(() => _model.mouse3Hovered = false);
                  }),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.7, -0.05),
                child: Transform.rotate(
                  angle: 62.0 * (math.pi / 180),
                  child: Opacity(
                    opacity: (_model.mouse3Hovered == true) ||
                            (_model.mouse2Hovered == true) ||
                            (_model.mouse1Hovered == true)
                        ? 0.08
                        : 1.0,
                    child: Text(
                      'RELEVANTE',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 28.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ).animateOnActionTrigger(
                      animationsMap['textOnActionTriggerAnimation1']!,
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: (_model.mouse3Hovered == true) ||
                        (_model.mouse2Hovered == true) ||
                        (_model.mouse1Hovered == true)
                    ? 0.08
                    : 1.0,
                child: Align(
                  alignment: AlignmentDirectional(0.02, 0.97),
                  child: Text(
                    'CONCRETO',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 28.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ).animateOnActionTrigger(
                    animationsMap['textOnActionTriggerAnimation2']!,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.6, -0.08),
                child: Transform.rotate(
                  angle: 300.0 * (math.pi / 180),
                  child: Opacity(
                    opacity: (_model.mouse3Hovered == true) ||
                            (_model.mouse2Hovered == true) ||
                            (_model.mouse1Hovered == true)
                        ? 0.08
                        : 1.0,
                    child: Text(
                      'RETADOR',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 28.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ).animateOnActionTrigger(
                      animationsMap['textOnActionTriggerAnimation3']!,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
