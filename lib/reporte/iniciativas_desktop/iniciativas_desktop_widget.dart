import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/reporte/card_iniciativa_desktop/card_iniciativa_desktop_widget.dart';
import 'dart:ui';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'iniciativas_desktop_model.dart';
export 'iniciativas_desktop_model.dart';

class IniciativasDesktopWidget extends StatefulWidget {
  const IniciativasDesktopWidget({super.key});

  @override
  State<IniciativasDesktopWidget> createState() =>
      _IniciativasDesktopWidgetState();
}

class _IniciativasDesktopWidgetState extends State<IniciativasDesktopWidget> {
  late IniciativasDesktopModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IniciativasDesktopModel());

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
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MouseRegion(
                    opaque: false,
                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                    child: Opacity(
                      opacity: () {
                        if (_model.seleccionado == 1) {
                          return 1.0;
                        } else if (_model.mouseRegionHovered == true) {
                          return 0.6;
                        } else {
                          return 0.2;
                        }
                      }(),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.seleccionado = 1;
                          safeSetState(() {});
                        },
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 519.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: _model.seleccionado == 1 ? 4.0 : 2.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF5EFFFF),
                                ),
                              ),
                              if (_model.seleccionado == 1)
                                Expanded(
                                  child: Text(
                                    'Escenario 1',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: Color(0xFF5EFFFF),
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                              Expanded(
                                child: Text(
                                  'Materiales y tecnologías sin fronteras',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: Color(0xFF5EFFFF),
                                        fontSize: 45.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(height: 23.0)),
                          ),
                        ),
                      ),
                    ),
                    onEnter: ((event) async {
                      safeSetState(() => _model.mouseRegionHovered = true);
                    }),
                    onExit: ((event) async {
                      safeSetState(() => _model.mouseRegionHovered = false);
                    }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Builder(
                    builder: (context) => Padding(
                      padding: EdgeInsets.all(15.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showAlignedDialog(
                            context: context,
                            isGlobal: false,
                            avoidOverflow: true,
                            targetAnchor: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            followerAnchor: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            builder: (dialogContext) {
                              return Material(
                                color: Colors.transparent,
                                child: WebViewAware(
                                  child: CardIniciativaDesktopWidget(),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: 375.0,
                            maxHeight: 383.0,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: Image.asset(
                                'assets/images/Escenario_IMG.png',
                              ).image,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8.0,
                                color: Color(0x735EFFFF),
                                spreadRadius: 3.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.transparent, Color(0xC0000000)],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 19.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Operador de redes logisticas \ninteligentes',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.anekLatin(
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 35.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
          ].divide(SizedBox(width: 206.0)),
        ),
      ),
    );
  }
}
