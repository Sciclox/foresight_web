import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
      width: 700.0,
      decoration: BoxDecoration(
        color: Color(0xFF10092D),
      ),
      child: Container(
        width: 700.0,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: ClipOval(
                child: Container(
                  width: 700.0,
                  height: 700.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 400.0,
                        color: FlutterFlowTheme.of(context).primary,
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                        spreadRadius: 100.0,
                      )
                    ],
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0x114B39EF),
                    ),
                  ),
                  child: FlutterFlowVideoPlayer(
                    path: 'assets/videos/3738724407-preview.mp4',
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
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 760.0,
                height: 760.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/images/circleblur_-_v03.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 1000.0,
                height: 1000.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/images/circleblur_-_v02.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 450.0,
                height: 450.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
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
