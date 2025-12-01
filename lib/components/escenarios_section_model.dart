import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'escenarios_section_widget.dart' show EscenariosSectionWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
