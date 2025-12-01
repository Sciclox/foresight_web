import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_mobile_model.dart';
export 'nav_mobile_model.dart';

class NavMobileWidget extends StatefulWidget {
  const NavMobileWidget({super.key});

  @override
  State<NavMobileWidget> createState() => _NavMobileWidgetState();
}

class _NavMobileWidgetState extends State<NavMobileWidget> {
  late NavMobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavMobileModel());

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
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20.0,
          sigmaY: 20.0,
        ),
        child: Visibility(
          visible: responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ),
          child: Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(
                      'assets/images/Logo_F5.svg',
                      width: 64.0,
                      height: 64.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 0.0,
                        sigmaY: 1.0,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 1.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Ver Escenarios 2025',
                          options: FFButtonOptions(
                            width: 214.0,
                            height: 56.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0x00FFFFFF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleSmallIsCustom,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Color(0x6CFFFFFF),
                            ),
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 90.0,
                    icon: Icon(
                      Icons.menu,
                      color: FlutterFlowTheme.of(context).info,
                      size: 32.0,
                    ),
                    onPressed: () async {
                      FFAppState().showMenu = true;
                      safeSetState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
