import '/flutter_flow/flutter_flow_util.dart';
import '/home_sections/components/triangle/triangle_desktop/triangle_desktop_widget.dart';
import 'ecosistema_interno_desktop_widget.dart'
    show EcosistemaInternoDesktopWidget;
import 'package:flutter/material.dart';

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
