import '/flutter_flow/flutter_flow_util.dart';
import 'i_a_modal2_mobile_widget.dart' show IAModal2MobileWidget;
import 'package:flutter/material.dart';

class IAModal2MobileModel extends FlutterFlowModel<IAModal2MobileWidget> {
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
