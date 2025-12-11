import '/flutter_flow/flutter_flow_util.dart';
import '/home_sections/components/info_content/info_content_mobile/info_content_mobile_widget.dart';
import 'por_que_lo_hacemos_mobile_widget.dart' show PorQueLoHacemosMobileWidget;
import 'package:flutter/material.dart';

class PorQueLoHacemosMobileModel
    extends FlutterFlowModel<PorQueLoHacemosMobileWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for InfoContentMobile component.
  late InfoContentMobileModel infoContentMobileModel;

  @override
  void initState(BuildContext context) {
    infoContentMobileModel =
        createModel(context, () => InfoContentMobileModel());
  }

  @override
  void dispose() {
    infoContentMobileModel.dispose();
  }
}
