import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'triangle_mobile3_model.dart';
export 'triangle_mobile3_model.dart';

class TriangleMobile3Widget extends StatefulWidget {
  const TriangleMobile3Widget({super.key});

  @override
  State<TriangleMobile3Widget> createState() => _TriangleMobile3WidgetState();
}

class _TriangleMobile3WidgetState extends State<TriangleMobile3Widget> {
  late TriangleMobile3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TriangleMobile3Model());

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
        width: 392.0,
        height: 340.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            alignment: const AlignmentDirectional(0.0, 0.0),
            image: Image.asset(
              'assets/images/shine02.png',
            ).image,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 0.0),
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -0.9),
                child: MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  onEnter: ((event) async {
                    safeSetState(() => _model.mouse1Hovered = true);
                  }),
                  onExit: ((event) async {
                    safeSetState(() => _model.mouse1Hovered = false);
                  }),
                  child: SizedBox(
                    width: 150.0,
                    height: 150.0,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/triangle_1_(1).png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.92, 0.75),
                child: MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  onEnter: ((event) async {
                    safeSetState(() => _model.mouse2Hovered = true);
                  }),
                  onExit: ((event) async {
                    safeSetState(() => _model.mouse2Hovered = false);
                  }),
                  child: Align(
                    alignment: const AlignmentDirectional(-0.8, 1.0),
                    child: SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Triangle_2_(3).png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.73),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/triangle_2_(1).png',
                    width: 140.0,
                    height: 140.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.97, 0.8),
                child: MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  onEnter: ((event) async {
                    safeSetState(() => _model.mouse3Hovered = true);
                  }),
                  onExit: ((event) async {
                    safeSetState(() => _model.mouse3Hovered = false);
                  }),
                  child: Align(
                    alignment: const AlignmentDirectional(0.8, 1.0),
                    child: SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/State=Default_(2).png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.7, -0.05),
                child: Transform.rotate(
                  angle: 62.0 * (math.pi / 180),
                  child: Opacity(
                    opacity: 0.08,
                    child: Text(
                      'RELEVANTE',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.08,
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Text(
                    'CONCRETO',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 13.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.65, -0.08),
                child: Transform.rotate(
                  angle: 300.0 * (math.pi / 180),
                  child: Opacity(
                    opacity: 0.08,
                    child: Text(
                      'RETADOR',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
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
