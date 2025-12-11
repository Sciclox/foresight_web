import '/flutter_flow/flutter_flow_util.dart';
import 'i_a_modal_mobile_widget.dart' show IAModalMobileWidget;
import 'package:flutter/material.dart';

class IAModalMobileModel extends FlutterFlowModel<IAModalMobileWidget> {
  ///  Local state fields for this component.

  bool boton = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
