import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_sections/components/info_content/info_content_desktop/info_content_desktop_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'por_que_lo_hacemos_desktop_widget.dart'
    show PorQueLoHacemosDesktopWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PorQueLoHacemosDesktopModel
    extends FlutterFlowModel<PorQueLoHacemosDesktopWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for InfoContentDesktop component.
  late InfoContentDesktopModel infoContentDesktopModel;

  @override
  void initState(BuildContext context) {
    infoContentDesktopModel =
        createModel(context, () => InfoContentDesktopModel());
  }

  @override
  void dispose() {
    infoContentDesktopModel.dispose();
  }
}
