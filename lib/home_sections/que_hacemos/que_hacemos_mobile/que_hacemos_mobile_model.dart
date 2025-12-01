import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_sections/components/sphere/sphere_mobile/sphere_mobile_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'que_hacemos_mobile_widget.dart' show QueHacemosMobileWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QueHacemosMobileModel extends FlutterFlowModel<QueHacemosMobileWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for sphereMobile component.
  late SphereMobileModel sphereMobileModel;

  @override
  void initState(BuildContext context) {
    sphereMobileModel = createModel(context, () => SphereMobileModel());
  }

  @override
  void dispose() {
    sphereMobileModel.dispose();
  }
}
