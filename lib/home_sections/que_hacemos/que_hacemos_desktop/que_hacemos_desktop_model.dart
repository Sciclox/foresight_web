import '/flutter_flow/flutter_flow_util.dart';
import '/home_sections/components/sphere/sphere_desktop/sphere_desktop_widget.dart';
import 'que_hacemos_desktop_widget.dart' show QueHacemosDesktopWidget;
import 'package:flutter/material.dart';

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
