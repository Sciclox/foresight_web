import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_sections/components/info_content/info_content_mobile/info_content_mobile_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'por_que_lo_hacemos_mobile_model.dart';
export 'por_que_lo_hacemos_mobile_model.dart';

class PorQueLoHacemosMobileWidget extends StatefulWidget {
  const PorQueLoHacemosMobileWidget({super.key});

  @override
  State<PorQueLoHacemosMobileWidget> createState() =>
      _PorQueLoHacemosMobileWidgetState();
}

class _PorQueLoHacemosMobileWidgetState
    extends State<PorQueLoHacemosMobileWidget> with TickerProviderStateMixin {
  late PorQueLoHacemosMobileModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PorQueLoHacemosMobileModel());

    animationsMap.addAll({
      'richTextOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.1,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.1,
            end: 1.0,
          ),
        ],
      ),
    });

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(-1.0, 1.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/bg_ellipse_blur_2.png',
                width: 583.0,
                fit: BoxFit.cover,
                alignment: Alignment(-1.0, 1.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 649.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 100.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '¿Por qué lo hacemos?',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.anekLatin(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: MediaQuery.sizeOf(context).width *
                                        0.0909,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Nuestro propósito es claro: construimos futuros habitables que sean ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.0409,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'retadores',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.0409,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                    TextSpan(
                                      text: ', relevantes y concretos.',
                                      style: GoogleFonts.anekLatin(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontWeight: FontWeight.w300,
                                        fontSize:
                                            MediaQuery.sizeOf(context).width *
                                                0.0409,
                                      ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'richTextOnPageLoadAnimation']!),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 32.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 32.0),
                  child: wrapWithModel(
                    model: _model.infoContentMobileModel,
                    updateCallback: () => safeSetState(() {}),
                    child: InfoContentMobileWidget(),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Text(
                          'Creemos que el futuro no se adivina, se diseña.  Anticipar nos abre a múltiples posibilidades y nos permite tomar mejores decisiones, impulsar la innovación y fortalecer la resiliencia de Pacasmayo.',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.anekLatin(
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                fontSize:
                                    MediaQuery.sizeOf(context).width * 0.0409,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation']!),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
