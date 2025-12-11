import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'i_a_modal_desktop_widget.dart' show IAModalDesktopWidget;
import 'package:flutter/material.dart';

class IAModalDesktopModel extends FlutterFlowModel<IAModalDesktopWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Agent API)] action in TextField widget.
  ApiCallResponse? agentResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
