import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_sections/components/triangle/triangle_desktop/triangle_desktop_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'ecosistema_interno_desktop_widget.dart'
    show EcosistemaInternoDesktopWidget;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EcosistemaInternoDesktopModel
    extends FlutterFlowModel<EcosistemaInternoDesktopWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TriangleDesktop component.
  late TriangleDesktopModel triangleDesktopModel;

  @override
  void initState(BuildContext context) {
    triangleDesktopModel = createModel(context, () => TriangleDesktopModel());
  }

  @override
  void dispose() {
    triangleDesktopModel.dispose();
  }
}
