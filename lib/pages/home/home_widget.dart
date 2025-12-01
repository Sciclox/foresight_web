import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_sections/como_lo_hacemos/como_lo_hacemos1_desktop/como_lo_hacemos1_desktop_widget.dart';
import '/home_sections/como_lo_hacemos/como_lo_hacemos2_desktop/como_lo_hacemos2_desktop_widget.dart';
import '/home_sections/como_lo_hacemos/como_lo_hacemos2_mobile/como_lo_hacemos2_mobile_widget.dart';
import '/home_sections/como_lo_hacemos/como_lo_hacemos3_mobile/como_lo_hacemos3_mobile_widget.dart';
import '/home_sections/components/i_a_button/i_a_button_desktop/i_a_button_desktop_widget.dart';
import '/home_sections/components/i_a_button/i_a_button_hover_desktop/i_a_button_hover_desktop_widget.dart';
import '/home_sections/components/i_a_button/i_a_button_mobile/i_a_button_mobile_widget.dart';
import '/home_sections/components/i_a_modal/i_a_modal_desktop/i_a_modal_desktop_widget.dart';
import '/home_sections/components/i_a_modal/i_a_modal_mobile/i_a_modal_mobile_widget.dart';
import '/home_sections/components/menu/menu_desktop/menu_desktop_widget.dart';
import '/home_sections/components/menu/menu_mobile/menu_mobile_widget.dart';
import '/home_sections/components/nav/nav_desktop/nav_desktop_widget.dart';
import '/home_sections/components/nav/nav_mobile/nav_mobile_widget.dart';
import '/home_sections/ecosistema_interno/ecosistema_interno_desktop/ecosistema_interno_desktop_widget.dart';
import '/home_sections/ecosistema_interno/ecosistema_interno_mobile1/ecosistema_interno_mobile1_widget.dart';
import '/home_sections/ecosistema_interno/ecosistema_interno_mobile2/ecosistema_interno_mobile2_widget.dart';
import '/home_sections/ecosistema_interno/ecosistema_interno_mobile3/ecosistema_interno_mobile3_widget.dart';
import '/home_sections/ecosistema_interno/ecosistema_interno_mobile4/ecosistema_interno_mobile4_widget.dart';
import '/home_sections/footer/footer_desktop/footer_desktop_widget.dart';
import '/home_sections/footer/footer_mobile/footer_mobile_widget.dart';
import '/home_sections/hero/hero_desktop/hero_desktop_widget.dart';
import '/home_sections/hero/hero_mobile/hero_mobile_widget.dart';
import '/home_sections/por_que_lo_hacemos/por_que_lo_hacemos_mobile/por_que_lo_hacemos_mobile_widget.dart';
import '/home_sections/que_hacemos/que_hacemos_desktop/que_hacemos_desktop_widget.dart';
import '/home_sections/que_hacemos/que_hacemos_mobile/que_hacemos_mobile_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    animationsMap.addAll({
      'menuMobileOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -MediaQuery.sizeOf(context).height * 0.9),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'menuDesktopOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -200),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'iAModalDesktopOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, MediaQuery.sizeOf(context).height),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'iAModalMobileOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, MediaQuery.sizeOf(context).height),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF10092D),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            wrapWithModel(
                              model: _model.heroDesktopModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: HeroDesktopWidget(),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            wrapWithModel(
                              model: _model.heroMobileModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: HeroMobileWidget(),
                            ),
                        ],
                      ),
                      Stack(
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 90.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.queHacemosMobileModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: QueHacemosMobileWidget(),
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            wrapWithModel(
                              model: _model.queHacemosDesktopModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: QueHacemosDesktopWidget(),
                            ),
                        ],
                      ),
                      Stack(
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            wrapWithModel(
                              model: _model.comoLoHacemos1DesktopModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: ComoLoHacemos1DesktopWidget(),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            wrapWithModel(
                              model: _model.porQueLoHacemosMobileModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: PorQueLoHacemosMobileWidget(),
                            ),
                        ],
                      ),
                      Stack(
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            wrapWithModel(
                              model: _model.comoLoHacemos2MobileModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: ComoLoHacemos2MobileWidget(),
                            ),
                        ],
                      ),
                      Stack(
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            wrapWithModel(
                              model: _model.comoLoHacemos3MobileModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: ComoLoHacemos3MobileWidget(),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            wrapWithModel(
                              model: _model.comoLoHacemos2DesktopModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: ComoLoHacemos2DesktopWidget(),
                            ),
                        ],
                      ),
                      Stack(
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 200.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.ecosistemaInternoDesktopModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: EcosistemaInternoDesktopWidget(),
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            wrapWithModel(
                              model: _model.ecosistemaInternoMobile1Model,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: EcosistemaInternoMobile1Widget(),
                            ),
                        ],
                      ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        wrapWithModel(
                          model: _model.ecosistemaInternoMobile2Model,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: EcosistemaInternoMobile2Widget(),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        wrapWithModel(
                          model: _model.ecosistemaInternoMobile3Model,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: EcosistemaInternoMobile3Widget(),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        wrapWithModel(
                          model: _model.ecosistemaInternoMobile4Model,
                          updateCallback: () => safeSetState(() {}),
                          child: EcosistemaInternoMobile4Widget(),
                        ),
                      Stack(
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            wrapWithModel(
                              model: _model.footerDesktopModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: FooterDesktopWidget(),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            wrapWithModel(
                              model: _model.footerMobileModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: FooterMobileWidget(),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Stack(
                    children: [
                      wrapWithModel(
                        model: _model.navDesktopModel,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: NavDesktopWidget(),
                      ),
                      wrapWithModel(
                        model: _model.navMobileModel,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: NavMobileWidget(),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      if (FFAppState().showMenu == true)
                        wrapWithModel(
                          model: _model.menuMobileModel,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: MenuMobileWidget(),
                        ).animateOnPageLoad(
                            animationsMap['menuMobileOnPageLoadAnimation']!),
                      if (FFAppState().showMenu == true)
                        wrapWithModel(
                          model: _model.menuDesktopModel,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: MenuDesktopWidget(),
                        ).animateOnPageLoad(
                            animationsMap['menuDesktopOnPageLoadAnimation']!),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Stack(
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.10833,
                                0.0,
                              ),
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.1,
                                0.0,
                              )),
                          child: wrapWithModel(
                            model: _model.iAButtonDesktopModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: IAButtonDesktopWidget(),
                          ),
                        ),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.10833,
                                0.0,
                              ),
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).height * 0.1,
                                0.0,
                              )),
                          child: wrapWithModel(
                            model: _model.iAButtonHoverDesktopModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: IAButtonHoverDesktopWidget(),
                          ),
                        ),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 12.0),
                          child: wrapWithModel(
                            model: _model.iAButtonMobileModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: IAButtonMobileWidget(),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Stack(
                children: [
                  if ((FFAppState().isShowIAPage == true) &&
                      responsiveVisibility(
                        context: context,
                        phone: false,
                      ))
                    wrapWithModel(
                      model: _model.iAModalDesktopModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: IAModalDesktopWidget(),
                    ).animateOnPageLoad(
                        animationsMap['iAModalDesktopOnPageLoadAnimation']!),
                  if ((FFAppState().isShowIAPage == true) &&
                      responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                    wrapWithModel(
                      model: _model.iAModalMobileModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: IAModalMobileWidget(),
                    ).animateOnPageLoad(
                        animationsMap['iAModalMobileOnPageLoadAnimation']!),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
