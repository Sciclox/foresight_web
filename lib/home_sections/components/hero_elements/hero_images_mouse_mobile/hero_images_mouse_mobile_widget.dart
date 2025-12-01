import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'hero_images_mouse_mobile_model.dart';
export 'hero_images_mouse_mobile_model.dart';

class HeroImagesMouseMobileWidget extends StatefulWidget {
  const HeroImagesMouseMobileWidget({super.key});

  @override
  State<HeroImagesMouseMobileWidget> createState() =>
      _HeroImagesMouseMobileWidgetState();
}

class _HeroImagesMouseMobileWidgetState
    extends State<HeroImagesMouseMobileWidget> {
  late HeroImagesMouseMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeroImagesMouseMobileModel());

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
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MouseRegion(
              opaque: false,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              child: Container(
                width: () {
                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered1 = true);
                FFAppState().image1 = true;
                safeSetState(() {});
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered1 = false);
                FFAppState().image1 = false;
                safeSetState(() {});
              }),
            ),
            Opacity(
              opacity: 0.35,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                child: Container(
                  width: 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.651852,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
            ),
            MouseRegion(
              opaque: false,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                child: Container(
                  width: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered2 = true);
                FFAppState().image2 = true;
                safeSetState(() {});
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered2 = false);
                FFAppState().image2 = false;
                safeSetState(() {});
              }),
            ),
            Opacity(
              opacity: 0.35,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: Container(
                  width: 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.651852,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
            ),
            MouseRegion(
              opaque: false,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 200.0, 0.0, 0.0),
                child: Container(
                  width: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered3 = true);
                FFAppState().image3 = true;
                safeSetState(() {});
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered3 = false);
                FFAppState().image3 = false;
                safeSetState(() {});
              }),
            ),
            Opacity(
              opacity: 0.35,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
                child: Container(
                  width: 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.651852,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
            ),
            MouseRegion(
              opaque: false,
              cursor: MouseCursor.defer ?? MouseCursor.defer,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: Container(
                  width: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
              onEnter: ((event) async {
                safeSetState(() => _model.mouseRegionHovered4 = true);
                FFAppState().image4 = true;
                safeSetState(() {});
              }),
              onExit: ((event) async {
                safeSetState(() => _model.mouseRegionHovered4 = false);
                FFAppState().image4 = false;
                safeSetState(() {});
              }),
            ),
          ],
        ),
      ),
    );
  }
}
