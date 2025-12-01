import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/reporte/card_iniciativa_desktop/card_iniciativa_desktop_widget.dart';
import 'dart:ui';
import 'iniciativas_desktop_widget.dart' show IniciativasDesktopWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class IniciativasDesktopModel
    extends FlutterFlowModel<IniciativasDesktopWidget> {
  ///  Local state fields for this component.

  int seleccionado = 1;

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
