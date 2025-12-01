import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sphere_mobile_model.dart';
export 'sphere_mobile_model.dart';

class SphereMobileWidget extends StatefulWidget {
  const SphereMobileWidget({super.key});

  @override
  State<SphereMobileWidget> createState() => _SphereMobileWidgetState();
}

class _SphereMobileWidgetState extends State<SphereMobileWidget> {
  late SphereMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SphereMobileModel());

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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Container(
          width: 392.0,
          height: 392.0,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ClipOval(
                    child: Container(
                      width: 392.0,
                      height: 392.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 400.0,
                            color: Colors.black,
                            offset: Offset(
                              0.0,
                              200.0,
                            ),
                            spreadRadius: 500.0,
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
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
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
              Opacity(
                opacity: 0.7,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 350.0,
                    height: 350.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/images/circleblur_-_v03.svg',
                      fit: BoxFit.contain,
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
