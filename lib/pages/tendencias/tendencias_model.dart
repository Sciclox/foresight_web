import '/flutter_flow/flutter_flow_util.dart';
import '/reporte/nav_reporte_mobile/nav_reporte_mobile_widget.dart';
import 'tendencias_widget.dart' show TendenciasWidget;
import 'package:flutter/material.dart';

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
