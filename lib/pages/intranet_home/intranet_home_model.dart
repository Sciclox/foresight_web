import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'intranet_home_widget.dart' show IntranetHomeWidget;
import 'package:flutter/material.dart';

class IntranetHomeModel extends FlutterFlowModel<IntranetHomeWidget> {
  ///  Local state fields for this page.

  bool? searchActive;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ReporteRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
