import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/reporte/nav_reporte_mobile/nav_reporte_mobile_widget.dart';
import 'dart:ui';
import 'tendencias_widget.dart' show TendenciasWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TendenciasModel extends FlutterFlowModel<TendenciasWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavReporteMobile component.
  late NavReporteMobileModel navReporteMobileModel;

  @override
  void initState(BuildContext context) {
    navReporteMobileModel = createModel(context, () => NavReporteMobileModel());
  }

  @override
  void dispose() {
    navReporteMobileModel.dispose();
  }
}
