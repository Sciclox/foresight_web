import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_sections/components/info_content/info_content_mobile/info_content_mobile_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'por_que_lo_hacemos_mobile_widget.dart' show PorQueLoHacemosMobileWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PorQueLoHacemosMobileModel
    extends FlutterFlowModel<PorQueLoHacemosMobileWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for InfoContentMobile component.
  late InfoContentMobileModel infoContentMobileModel;

  @override
  void initState(BuildContext context) {
    infoContentMobileModel =
        createModel(context, () => InfoContentMobileModel());
  }

  @override
  void dispose() {
    infoContentMobileModel.dispose();
  }
}
