import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
      ),
      child: MouseRegion(
        opaque: false,
        cursor: MouseCursor.defer ?? MouseCursor.defer,
        child: Visibility(
          visible: responsiveVisibility(
            context: context,
            phone: false,
          ),
          child: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: Color(0x19FFFFFF),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x00000040),
                  offset: Offset(
                    0.0,
                    4.0,
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
                      blurRadius: 200.0,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      offset: Offset(
                        100.0,
                        1.0,
                      ),
                      spreadRadius: 200.0,
                    )
                  ],
                  shape: BoxShape.circle,
                ),
                child: Opacity(
                  opacity: 0.9,
                  child: FlutterFlowVideoPlayer(
                    path: 'assets/videos/ia_1.mp4',
                    videoType: VideoType.asset,
                    width: 150.0,
                    height: 150.0,
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
        onEnter: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = true);
          FFAppState().iaShow = true;
          safeSetState(() {});
        }),
        onExit: ((event) async {
          safeSetState(() => _model.mouseRegionHovered = false);
        }),
      ),
    );
  }
}
