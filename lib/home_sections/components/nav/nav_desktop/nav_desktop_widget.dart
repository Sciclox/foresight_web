import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'nav_desktop_model.dart';
export 'nav_desktop_model.dart';

class NavDesktopWidget extends StatefulWidget {
  const NavDesktopWidget({super.key});

  @override
  State<NavDesktopWidget> createState() => _NavDesktopWidgetState();
}

class _NavDesktopWidgetState extends State<NavDesktopWidget> {
  late NavDesktopModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavDesktopModel());

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
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(26.0, 0.0, 26.0, 0.0),
        child: Container(
          decoration: const BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                valueOrDefault<double>(
                  MediaQuery.sizeOf(context).width * 0.076,
                  0.0,
                ),
                28.0,
                valueOrDefault<double>(
                  MediaQuery.sizeOf(context).width * 0.076,
                  0.0,
                ),
                28.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(IntranetHomeWidget.routeName);
                      },
                      text: 'Ver Escenarios 2025',
                      options: FFButtonOptions(
                        width: 214.0,
                        height: 56.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0x00FFFFFF),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleSmallFamily,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .titleSmallIsCustom,
                            ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Color(0x37FFFFFF),
                        ),
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
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
                  ].divide(const SizedBox(width: 68.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
