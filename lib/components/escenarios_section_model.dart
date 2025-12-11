import '/flutter_flow/flutter_flow_util.dart';
import 'escenarios_section_widget.dart' show EscenariosSectionWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EscenariosSectionModel extends FlutterFlowModel<EscenariosSectionWidget> {
  ///  Local state fields for this component.

  int? maxIndex;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CardEscenarios widget.
  CarouselSliderController? cardEscenariosController;
  int cardEscenariosCurrentIndex = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
