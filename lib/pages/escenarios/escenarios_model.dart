import '/flutter_flow/flutter_flow_util.dart';
import '/reporte/cards_data/cards_data_widget.dart';
import '/reporte/nav_reporte_mobile/nav_reporte_mobile_widget.dart';
import 'escenarios_widget.dart' show EscenariosWidget;
import 'package:flutter/material.dart';

class EscenariosModel extends FlutterFlowModel<EscenariosWidget> {
  ///  Local state fields for this page.

  List<bool> habitantes = [false, false];
  void addToHabitantes(bool item) => habitantes.add(item);
  void removeFromHabitantes(bool item) => habitantes.remove(item);
  void removeAtIndexFromHabitantes(int index) => habitantes.removeAt(index);
  void insertAtIndexInHabitantes(int index, bool item) =>
      habitantes.insert(index, item);
  void updateHabitantesAtIndex(int index, Function(bool) updateFn) =>
      habitantes[index] = updateFn(habitantes[index]);

  ///  State fields for stateful widgets in this page.

  // Model for CardsData component.
  late CardsDataModel cardsDataModel1;
  // Model for CardsData component.
  late CardsDataModel cardsDataModel2;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Model for NavReporteMobile component.
  late NavReporteMobileModel navReporteMobileModel;

  @override
  void initState(BuildContext context) {
    cardsDataModel1 = createModel(context, () => CardsDataModel());
    cardsDataModel2 = createModel(context, () => CardsDataModel());
    navReporteMobileModel = createModel(context, () => NavReporteMobileModel());
  }

  @override
  void dispose() {
    cardsDataModel1.dispose();
    cardsDataModel2.dispose();
    navReporteMobileModel.dispose();
  }
}
