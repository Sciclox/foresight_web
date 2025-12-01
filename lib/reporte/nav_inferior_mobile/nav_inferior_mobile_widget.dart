import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_inferior_mobile_model.dart';
export 'nav_inferior_mobile_model.dart';

class NavInferiorMobileWidget extends StatefulWidget {
  const NavInferiorMobileWidget({
    super.key,
    bool? parameter1,
    bool? parameter2,
    bool? parameter3,
  })  : this.parameter1 = parameter1 ?? false,
        this.parameter2 = parameter2 ?? false,
        this.parameter3 = parameter3 ?? false;

  final bool parameter1;
  final bool parameter2;
  final bool parameter3;

  @override
  State<NavInferiorMobileWidget> createState() =>
      _NavInferiorMobileWidgetState();
}

class _NavInferiorMobileWidgetState extends State<NavInferiorMobileWidget> {
  late NavInferiorMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavInferiorMobileModel());

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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        height: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 68.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 88.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 88.0;
          } else {
            return 88.0;
          }
        }(),
        constraints: BoxConstraints(
          maxWidth: 602.0,
        ),
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
          child: Stack(
            alignment: AlignmentDirectional(0.0, 1.0),
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 68.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(64.0),
                    border: Border.all(
                      color: Color(0x90FFFFFF),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(17.0, 0.0, 17.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(64.0),
                      bottomRight: Radius.circular(60.0),
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(64.0),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 20.0,
                        sigmaY: 20.0,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 68.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(64.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: MouseRegion(
                                  opaque: false,
                                  cursor:
                                      MouseCursor.defer ?? MouseCursor.defer,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(80.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 5.0,
                                        sigmaY: 5.0,
                                      ),
                                      child: Opacity(
                                        opacity: widget!.parameter1 == true
                                            ? 1.0
                                            : 0.5,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: () {
                                                if (widget!.parameter1 ==
                                                    true) {
                                                  return Color(0xD1382452);
                                                } else if (_model
                                                        .mouseRegionHovered1 ==
                                                    true) {
                                                  return Color(0xD6626262);
                                                } else {
                                                  return Color(0x00000000);
                                                }
                                              }(),
                                              borderRadius:
                                                  BorderRadius.circular(80.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Tendencias',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .anekLatin(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Step.png',
                                                    width: 24.0,
                                                    height: 24.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onEnter: ((event) async {
                                    safeSetState(() =>
                                        _model.mouseRegionHovered1 = true);
                                  }),
                                  onExit: ((event) async {
                                    safeSetState(() =>
                                        _model.mouseRegionHovered1 = false);
                                  }),
                                ),
                              ),
                              Expanded(
                                child: MouseRegion(
                                  opaque: false,
                                  cursor:
                                      MouseCursor.defer ?? MouseCursor.defer,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(80.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 5.0,
                                        sigmaY: 5.0,
                                      ),
                                      child: Opacity(
                                        opacity: widget!.parameter2 == true
                                            ? 1.0
                                            : 0.5,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: () {
                                                if (widget!.parameter2 ==
                                                    true) {
                                                  return Color(0x8A6C249D);
                                                } else if (_model
                                                        .mouseRegionHovered2 ==
                                                    true) {
                                                  return Color(0xD6626262);
                                                } else {
                                                  return Color(0x00000000);
                                                }
                                              }(),
                                              borderRadius:
                                                  BorderRadius.circular(80.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Escenarios',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .anekLatin(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Step.png',
                                                    width: 24.0,
                                                    height: 24.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onEnter: ((event) async {
                                    safeSetState(() =>
                                        _model.mouseRegionHovered2 = true);
                                  }),
                                  onExit: ((event) async {
                                    safeSetState(() =>
                                        _model.mouseRegionHovered2 = false);
                                  }),
                                ),
                              ),
                              Expanded(
                                child: MouseRegion(
                                  opaque: false,
                                  cursor:
                                      MouseCursor.defer ?? MouseCursor.defer,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(80.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 5.0,
                                        sigmaY: 5.0,
                                      ),
                                      child: Opacity(
                                        opacity: widget!.parameter3 == true
                                            ? 1.0
                                            : 0.5,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color: () {
                                                if (widget!.parameter3 ==
                                                    true) {
                                                  return Color(0x8A6C249D);
                                                } else if (_model
                                                        .mouseRegionHovered3 ==
                                                    true) {
                                                  return Color(0xD6626262);
                                                } else {
                                                  return Color(0x00000000);
                                                }
                                              }(),
                                              borderRadius:
                                                  BorderRadius.circular(80.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Iniciativas',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .anekLatin(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Step.png',
                                                    width: 24.0,
                                                    height: 24.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onEnter: ((event) async {
                                    safeSetState(() =>
                                        _model.mouseRegionHovered3 = true);
                                  }),
                                  onExit: ((event) async {
                                    safeSetState(() =>
                                        _model.mouseRegionHovered3 = false);
                                  }),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ),
                      ),
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
