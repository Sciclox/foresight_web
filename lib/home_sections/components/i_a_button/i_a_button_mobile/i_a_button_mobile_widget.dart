import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'i_a_button_mobile_model.dart';
export 'i_a_button_mobile_model.dart';

class IAButtonMobileWidget extends StatefulWidget {
  const IAButtonMobileWidget({super.key});

  @override
  State<IAButtonMobileWidget> createState() => _IAButtonMobileWidgetState();
}

class _IAButtonMobileWidgetState extends State<IAButtonMobileWidget> {
  late IAButtonMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IAButtonMobileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        ))
          Container(
            width: MediaQuery.sizeOf(context).width * 0.16,
            height: MediaQuery.sizeOf(context).width * 0.16,
            decoration: BoxDecoration(
              color: const Color(0x19FFFFFF),
              boxShadow: const [
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
                      offset: const Offset(
                        100.0,
                        1.0,
                      ),
                      spreadRadius: 200.0,
                    )
                  ],
                  shape: BoxShape.circle,
                ),
                child: const Opacity(
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
        if (responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        ))
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              FFAppState().isShowIAPage = true;
              safeSetState(() {});
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.15,
              height: MediaQuery.sizeOf(context).width * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10000.0),
              ),
            ),
          ),
      ],
    );
  }
}
