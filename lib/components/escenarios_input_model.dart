import '/flutter_flow/flutter_flow_util.dart';
import 'escenarios_input_widget.dart' show EscenariosInputWidget;
import 'package:flutter/material.dart';

class EscenariosInputModel extends FlutterFlowModel<EscenariosInputWidget> {
  ///  Local state fields for this component.

  List<String> impactos = [];
  void addToImpactos(String item) => impactos.add(item);
  void removeFromImpactos(String item) => impactos.remove(item);
  void removeAtIndexFromImpactos(int index) => impactos.removeAt(index);
  void insertAtIndexInImpactos(int index, String item) =>
      impactos.insert(index, item);
  void updateImpactosAtIndex(int index, Function(String) updateFn) =>
      impactos[index] = updateFn(impactos[index]);

  List<int> senales = [];
  void addToSenales(int item) => senales.add(item);
  void removeFromSenales(int item) => senales.remove(item);
  void removeAtIndexFromSenales(int index) => senales.removeAt(index);
  void insertAtIndexInSenales(int index, int item) =>
      senales.insert(index, item);
  void updateSenalesAtIndex(int index, Function(int) updateFn) =>
      senales[index] = updateFn(senales[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
