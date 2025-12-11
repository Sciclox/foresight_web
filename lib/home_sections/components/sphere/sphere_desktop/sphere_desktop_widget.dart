import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'sphere_desktop_model.dart';
export 'sphere_desktop_model.dart';

class SphereDesktopWidget extends StatefulWidget {
  const SphereDesktopWidget({super.key});

  @override
  State<SphereDesktopWidget> createState() => _SphereDesktopWidgetState();
}

class _SphereDesktopWidgetState extends State<SphereDesktopWidget> {
  late SphereDesktopModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SphereDesktopModel());

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
      width: scaleDesktop(700.0, context),
      decoration: const BoxDecoration(
        color: Color(0xFF10092D),
      ),
      child: SizedBox(
        width: scaleDesktop(700.0, context),
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: ClipOval(
                child: Container(
                  width: scaleDesktop(700.0, context),
                  height: scaleDesktop(700.0, context),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: scaleDesktop(400.0, context),
                        color: FlutterFlowTheme.of(context).primary,
                        offset: Offset(
                          0.0,
                          scaleDesktop(2.0, context),
                        ),
                        spreadRadius: scaleDesktop(100.0, context),
                      )
                    ],
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0x114B39EF),
                    ),
                  ),
                  child: const FlutterFlowVideoPlayer(
                    path: 'assets/videos/WebF5Home-Qu_hacemos.mp4',
                    videoType: VideoType.asset,
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
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: scaleDesktop(450.0, context),
                height: scaleDesktop(450.0, context),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/Ellipse_17.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
