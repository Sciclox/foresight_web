import '/flutter_flow/flutter_flow_util.dart';
import '/home_sections/components/info_content/info_content_desktop/info_content_desktop_widget.dart';
import 'por_que_lo_hacemos_desktop_widget.dart'
    show PorQueLoHacemosDesktopWidget;
import 'package:flutter/material.dart';

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
