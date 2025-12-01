import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/reporte/cards_data/cards_data_widget.dart';
import '/reporte/nav_reporte_mobile/nav_reporte_mobile_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'escenarios_widget.dart' show EscenariosWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EscenariosModel extends FlutterFlowModel<EscenariosWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CardsData component.
  late CardsDataModel cardsDataModel;
  // Model for NavReporteMobile component.
  late NavReporteMobileModel navReporteMobileModel;

  @override
  void initState(BuildContext context) {
    cardsDataModel = createModel(context, () => CardsDataModel());
    navReporteMobileModel = createModel(context, () => NavReporteMobileModel());
  }

  @override
  void dispose() {
    cardsDataModel.dispose();
    navReporteMobileModel.dispose();
  }
}
