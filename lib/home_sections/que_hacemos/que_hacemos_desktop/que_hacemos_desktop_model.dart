import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_sections/components/sphere/sphere_desktop/sphere_desktop_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'que_hacemos_desktop_widget.dart' show QueHacemosDesktopWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QueHacemosDesktopModel extends FlutterFlowModel<QueHacemosDesktopWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for sphereDesktop component.
  late SphereDesktopModel sphereDesktopModel;

  @override
  void initState(BuildContext context) {
    sphereDesktopModel = createModel(context, () => SphereDesktopModel());
  }

  @override
  void dispose() {
    sphereDesktopModel.dispose();
  }
}
