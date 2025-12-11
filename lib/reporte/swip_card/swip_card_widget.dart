import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'swip_card_model.dart';
export 'swip_card_model.dart';

class SwipCardWidget extends StatefulWidget {
  const SwipCardWidget({super.key});

  @override
  State<SwipCardWidget> createState() => _SwipCardWidgetState();
}

class _SwipCardWidgetState extends State<SwipCardWidget> {
  late SwipCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
    );
  }
}
