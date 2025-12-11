import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'i_a_button_desktop_model.dart';
export 'i_a_button_desktop_model.dart';

class IAButtonDesktopWidget extends StatefulWidget {
  const IAButtonDesktopWidget({super.key});

  @override
  State<IAButtonDesktopWidget> createState() => _IAButtonDesktopWidgetState();
}

class _IAButtonDesktopWidgetState extends State<IAButtonDesktopWidget> {
  late IAButtonDesktopModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IAButtonDesktopModel());

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
      ) && !FFAppState().iaShow,
      child: MouseRegion(
        opaque: false,
        cursor: MouseCursor.defer ?? MouseCursor.defer,
        onEnter: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = true);
          FFAppState().update(() {
          FFAppState().iaShow = true;
          });
        }),
        onExit: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = false);
        }),
        child: Visibility(
          visible: responsiveVisibility(
            context: context,
            phone: false,
          ),
          child: Container(
            width: scaleDesktop(80.0, context),
            height: scaleDesktop(80.0, context),
            decoration: BoxDecoration(
              color: const Color(0x19FFFFFF),
              boxShadow: [
                BoxShadow(
                  blurRadius: scaleDesktop(4.0, context),
                  color: const Color(0x00000040),
                  offset: Offset(
                    0.0,
                    scaleDesktop(4.0, context),
                  ),
                  spreadRadius: 0.0,
                )
              ],
              borderRadius: BorderRadius.circular(10000.0),
            ),
            child: ClipOval(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: scaleDesktop(200.0, context),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      offset: Offset(
                        scaleDesktop(100.0, context),
                        scaleDesktop(1.0, context),
                      ),
                      spreadRadius: scaleDesktop(200.0, context),
                    )
                  ],
                  shape: BoxShape.circle,
                ),
                child: Opacity(
                  opacity: 0.9,
                  child: FlutterFlowVideoPlayer(
                    path: 'assets/videos/ia_1.mp4',
                    videoType: VideoType.asset,
                    width: scaleDesktop(150.0, context),
                    height: scaleDesktop(150.0, context),
                    autoPlay: true,
                    looping: true,
                    showControls: false,
                    allowFullScreen: true,
                    allowPlaybackSpeedMenu: false,
                    pauseOnNavigate: false,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
