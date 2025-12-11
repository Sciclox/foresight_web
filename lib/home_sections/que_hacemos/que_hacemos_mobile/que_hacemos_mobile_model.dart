import '/flutter_flow/flutter_flow_util.dart';
import '/home_sections/components/sphere/sphere_mobile/sphere_mobile_widget.dart';
import 'que_hacemos_mobile_widget.dart' show QueHacemosMobileWidget;
import 'package:flutter/material.dart';

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
