import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'i_a_button_hover_desktop_model.dart';
export 'i_a_button_hover_desktop_model.dart';

class IAButtonHoverDesktopWidget extends StatefulWidget {
  const IAButtonHoverDesktopWidget({super.key});

  @override
  State<IAButtonHoverDesktopWidget> createState() =>
      _IAButtonHoverDesktopWidgetState();
}

class _IAButtonHoverDesktopWidgetState extends State<IAButtonHoverDesktopWidget>
    with TickerProviderStateMixin {
  late IAButtonHoverDesktopModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IAButtonHoverDesktopModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.2,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(178, 0.0),
            end: Offset(0.0, 0.0),
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

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
      ),
      child: MouseRegion(
        opaque: false,
        cursor: MouseCursor.defer ?? MouseCursor.defer,
        child: Visibility(
          visible: (FFAppState().iaShow == true) &&
              responsiveVisibility(
                context: context,
                phone: false,
              ),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              FFAppState().isShowIAPage = true;
              safeSetState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12.0,
                    color: Color(0xA7FF5CB6),
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                  )
                ],
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Color(0xFF5562FF),
                    Color(0xFFFF5CB6),
                    Color(0xA2FFFF8C)
                  ],
                  stops: [0.0, 0.2, 0.7, 0.8],
                  begin: AlignmentDirectional(1.0, -0.87),
                  end: AlignmentDirectional(-1.0, 0.87),
                ),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Container(
                  width: 274.0,
                  height: 78.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF0F092C),
                    borderRadius: BorderRadius.circular(10000.0),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.49, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(11.71, 0.0),
                                child: Text(
                                  'Hola, te acompaño \na explorar futuros',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.3,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ClipOval(
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/iaV01.gif',
                              ).image,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 400.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                                spreadRadius: 400.0,
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation2']!),
                    ],
                  ),
                ),
              ),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
        ),
        onEnter: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = true);
        }),
        onExit: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = false);
          FFAppState().iaShow = false;
          safeSetState(() {});
        }),
      ),
    );
  }
}
