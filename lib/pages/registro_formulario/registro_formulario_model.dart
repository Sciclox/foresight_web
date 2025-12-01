import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/habitante_card_data_widget.dart';
import '/components/habitante_card_periodos_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'registro_formulario_widget.dart' show RegistroFormularioWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistroFormularioModel
    extends FlutterFlowModel<RegistroFormularioWidget> {
  ///  Local state fields for this page.

  List<HabitantePeriodosStruct> cardsItems = [];
  void addToCardsItems(HabitantePeriodosStruct item) => cardsItems.add(item);
  void removeFromCardsItems(HabitantePeriodosStruct item) =>
      cardsItems.remove(item);
  void removeAtIndexFromCardsItems(int index) => cardsItems.removeAt(index);
  void insertAtIndexInCardsItems(int index, HabitantePeriodosStruct item) =>
      cardsItems.insert(index, item);
  void updateCardsItemsAtIndex(
          int index, Function(HabitantePeriodosStruct) updateFn) =>
      cardsItems[index] = updateFn(cardsItems[index]);

  List<HabitanteCardStruct> cardsItems2 = [];
  void addToCardsItems2(HabitanteCardStruct item) => cardsItems2.add(item);
  void removeFromCardsItems2(HabitanteCardStruct item) =>
      cardsItems2.remove(item);
  void removeAtIndexFromCardsItems2(int index) => cardsItems2.removeAt(index);
  void insertAtIndexInCardsItems2(int index, HabitanteCardStruct item) =>
      cardsItems2.insert(index, item);
  void updateCardsItems2AtIndex(
          int index, Function(HabitanteCardStruct) updateFn) =>
      cardsItems2[index] = updateFn(cardsItems2[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue1;
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode10;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode11;
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
  // State field(s) for Switch widget.
  bool? switchValue5;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode12;
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode13;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;

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

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    textFieldFocusNode7?.dispose();
    textController7?.dispose();

    textFieldFocusNode8?.dispose();
    textController8?.dispose();

    textFieldFocusNode9?.dispose();
    textController9?.dispose();

    textFieldFocusNode10?.dispose();
    textController10?.dispose();

    textFieldFocusNode11?.dispose();
    textController11?.dispose();

    textFieldFocusNode12?.dispose();
    textController12?.dispose();

    textFieldFocusNode13?.dispose();
    textController13?.dispose();
  }
}
