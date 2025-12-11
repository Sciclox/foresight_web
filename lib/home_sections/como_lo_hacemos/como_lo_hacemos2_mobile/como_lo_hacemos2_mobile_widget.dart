import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'como_lo_hacemos2_mobile_model.dart';
export 'como_lo_hacemos2_mobile_model.dart';

class ComoLoHacemos2MobileWidget extends StatefulWidget {
  const ComoLoHacemos2MobileWidget({super.key});

  @override
  State<ComoLoHacemos2MobileWidget> createState() =>
      _ComoLoHacemos2MobileWidgetState();
}

class _ComoLoHacemos2MobileWidgetState
    extends State<ComoLoHacemos2MobileWidget> {
  late ComoLoHacemos2MobileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComoLoHacemos2MobileModel());

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
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: Image.asset(
            'assets/images/blur-shadow_1_(3).png',
          ).image,
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/triangle_1_(2).png',
                  height: double.infinity,
                  fit: BoxFit.contain,
                  alignment: const Alignment(0.0, 1.0),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/triangle_1_(2).png',
                  height: double.infinity,
                  fit: BoxFit.contain,
                  alignment: const Alignment(0.0, 1.0),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, -0.5),
              child: Text(
                'future looking',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.anekLatin(
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: MediaQuery.sizeOf(context).width * 0.097727,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
