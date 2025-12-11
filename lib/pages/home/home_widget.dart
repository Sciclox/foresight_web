import '/auth/base_auth_user_provider.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home_sections/como_lo_hacemos/como_lo_hacemos1_desktop/como_lo_hacemos1_desktop_widget.dart';
import '/home_sections/como_lo_hacemos/como_lo_hacemos2_desktop/como_lo_hacemos2_desktop_widget.dart';
import '/home_sections/como_lo_hacemos/como_lo_hacemos2_mobile/como_lo_hacemos2_mobile_widget.dart';
import '/home_sections/como_lo_hacemos/como_lo_hacemos3_mobile/como_lo_hacemos3_mobile_widget.dart';
import '/home_sections/components/i_a_button/i_a_button_desktop/i_a_button_desktop_widget.dart';
import '/home_sections/components/i_a_button/i_a_button_hover_desktop/i_a_button_hover_desktop_widget.dart';
import '/home_sections/components/i_a_button/i_a_button_mobile/i_a_button_mobile_widget.dart';
import '/home_sections/components/i_a_modal/i_a_modal2_desktop/i_a_modal2_desktop_widget.dart';
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
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
  final scrollController = ScrollController();
  
  // GlobalKeys para las secciones
  final GlobalKey heroSectionKey = GlobalKey(debugLabel: 'heroSection');
  final GlobalKey queHacemosSectionKey = GlobalKey(debugLabel: 'queHacemosSection');
  final GlobalKey porQueLoHacemosSectionKey = GlobalKey(debugLabel: 'porQueLoHacemosSection');
  final GlobalKey comoLoHacemosSectionKey = GlobalKey(debugLabel: 'comoLoHacemosSection');
  final GlobalKey ecosistemaInternoSectionKey = GlobalKey(debugLabel: 'ecosistemaInternoSection');

  // Estado para controlar el bloqueo de scroll en QueHacemos
  double _queHacemosScrollProgress = 0.0;
  double? _lockedScrollPosition;

  final animationsMap = <String, AnimationInfo>{};
  
  // Método para hacer scroll a una sección
  void scrollToSection(GlobalKey sectionKey) {
    final context = sectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        alignment: 0.0, // Alinea al principio de la sección
        alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
      );
    }
  }

  // Callback para recibir el scrollProgress de QueHacemosDesktop
  void _onQueHacemosScrollProgressChanged(double progress) {
    setState(() {
      _queHacemosScrollProgress = progress;
      
      // Si estamos en animación (0.0 < progress < 1.0), bloquear el scroll
      if (progress > 0.0 && progress < 1.0) {
        // Calcular y guardar la posición de scroll bloqueada
        _lockScrollPositionForQueHacemos();
      } else {
        // Desbloquear cuando termine la animación
        _lockedScrollPosition = null;
      }
    });
  }

  void _lockScrollPositionForQueHacemos() {
    if (!scrollController.hasClients) return;
    
    final RenderBox? renderBox =
        queHacemosSectionKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final sectionTop = renderBox.localToGlobal(Offset.zero).dy;

    // Calcular la posición de scroll donde el top de la sección está en el top del viewport
    // Esto ocurre cuando scrollProgress = 0.5
    final targetPosition = scrollController.offset + sectionTop;
    
    // Solo bloquear si aún no está bloqueado o si cambió significativamente
    if (_lockedScrollPosition == null || 
        (_lockedScrollPosition! - targetPosition).abs() > 1.0) {
      _lockedScrollPosition = targetPosition.clamp(
        0.0,
        scrollController.position.maxScrollExtent,
      );
    }
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    // Si estamos en el rango de animación (0.0 < progress < 1.0)
    if (_queHacemosScrollProgress > 0.0 && 
        _queHacemosScrollProgress < 1.0 && 
        _lockedScrollPosition != null &&
        scrollController.hasClients) {
      
      final RenderBox? renderBox =
          queHacemosSectionKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox == null) return false;
      
      final sectionTop = renderBox.localToGlobal(Offset.zero).dy;
      final screenHeight = MediaQuery.of(context).size.height;
      
      // Si la sección está en el viewport y aún no completó la animación
      if (sectionTop <= 0 && sectionTop >= -screenHeight) {
        // Si ya completamos la animación, permitir scroll libre
        if (_queHacemosScrollProgress >= 1.0) {
          _lockedScrollPosition = null;
          return false;
        }
        
        // Durante la animación, ajustar el scroll para que avance progresivamente
        if (notification is ScrollUpdateNotification) {
          final delta = notification.scrollDelta ?? 0.0;
          final currentOffset = scrollController.offset;
          
          // Ajustar la velocidad del scroll para que avance gradualmente
          // El scroll debe avanzar más lentamente para permitir que la animación se complete
          final adjustedDelta = delta * 0.5; // Reducir velocidad del scroll a la mitad
          _lockedScrollPosition = (currentOffset + adjustedDelta).clamp(
            0.0,
            scrollController.position.maxScrollExtent,
          );
          
          // Ajustar la posición del scroll para mantener la animación
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (scrollController.hasClients && _lockedScrollPosition != null) {
              final diff = scrollController.offset - _lockedScrollPosition!;
              if (diff.abs() > 1.0) {
                scrollController.jumpTo(_lockedScrollPosition!);
              }
            }
          });
          
          return true; // Consumir el evento para controlar el scroll
        }
        
        // Bloquear overscroll durante la animación
        if (notification is OverscrollNotification) {
          return true; // Bloquear overscroll
        }
      }
    }
    
    return false; // Permitir el scroll normal
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        const Duration(
          milliseconds: 1300,
        ),
      );
      if (!loggedIn) {
        context.pushNamed(LoginWidget.routeName);
      }
    });

    animationsMap.addAll({
      'menuMobileOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -MediaQuery.sizeOf(context).height * 0.9),
            end: const Offset(0.0, 0.0),
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
            begin: const Offset(0.0, -200),
            end: const Offset(0.0, 0.0),
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
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'iAModal2DesktopOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, MediaQuery.sizeOf(context).height),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    scrollController.dispose();
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
        backgroundColor: const Color(0xFF10092D),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: NotificationListener<ScrollNotification>(
                  onNotification: _handleScrollNotification,
                child: SingleChildScrollView(
                    controller: scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        key: heroSectionKey,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            wrapWithModel(
                              model: _model.heroDesktopModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: const HeroDesktopWidget(),
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
                              child: const HeroMobileWidget(),
                            ),
                        ],
                      ),
                      Stack(
                        key: queHacemosSectionKey,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 90.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.queHacemosMobileModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: const QueHacemosMobileWidget(),
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
                              child: QueHacemosDesktopWidget(
                                externalScrollController: scrollController,
                                onScrollProgressChanged: _onQueHacemosScrollProgressChanged,
                              ),
                            ),
                        ],
                      ),
                      Stack(
                        key: porQueLoHacemosSectionKey,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            wrapWithModel(
                              model: _model.comoLoHacemos1DesktopModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: const ComoLoHacemos1DesktopWidget(),
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
                              child: const PorQueLoHacemosMobileWidget(),
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
                              child: const ComoLoHacemos2MobileWidget(),
                            ),
                        ],
                      ),
                      Stack(
                        key: comoLoHacemosSectionKey,
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
                              child: const ComoLoHacemos3MobileWidget(),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            wrapWithModel(
                              model: _model.comoLoHacemos2DesktopModel,
                              updateCallback: () => safeSetState(() {}),
                              updateOnChange: true,
                              child: const ComoLoHacemos2DesktopWidget(),
                            ),
                        ],
                      ),
                      Stack(
                        key: ecosistemaInternoSectionKey,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 200.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.ecosistemaInternoDesktopModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: const EcosistemaInternoDesktopWidget(),
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
                              child: const EcosistemaInternoMobile1Widget(),
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
                          child: const EcosistemaInternoMobile2Widget(),
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
                          child: const EcosistemaInternoMobile3Widget(),
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
                          child: const EcosistemaInternoMobile4Widget(),
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
                              child: const FooterDesktopWidget(),
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
                              child: const FooterMobileWidget(),
                            ),
                        ],
                      ),
                    ],
                  ),
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
                        child: const NavDesktopWidget(),
                      ),
                      wrapWithModel(
                        model: _model.navMobileModel,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: const NavMobileWidget(),
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
                          child: const MenuMobileWidget(),
                        ).animateOnPageLoad(
                            animationsMap['menuMobileOnPageLoadAnimation']!),
                      if (FFAppState().showMenu == true)
                        wrapWithModel(
                          model: _model.menuDesktopModel,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: MenuDesktopWidget(
                            onScrollToHero: () => scrollToSection(heroSectionKey),
                            onScrollToQueHacemos: () => scrollToSection(queHacemosSectionKey),
                            onScrollToPorQueLoHacemos: () => scrollToSection(porQueLoHacemosSectionKey),
                            onScrollToComoLoHacemos: () => scrollToSection(comoLoHacemosSectionKey),
                            onScrollToEcosistemaInterno: () => scrollToSection(ecosistemaInternoSectionKey),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['menuDesktopOnPageLoadAnimation']!),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Stack(
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      Align(
                        alignment: const AlignmentDirectional(1.0, 1.0),
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
                            child: const IAButtonDesktopWidget(),
                          ),
                        ),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      Align(
                        alignment: const AlignmentDirectional(1.0, 1.0),
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
                            child: const IAButtonHoverDesktopWidget(),
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
                        alignment: const AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 12.0),
                          child: wrapWithModel(
                            model: _model.iAButtonMobileModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: const IAButtonMobileWidget(),
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
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                    wrapWithModel(
                      model: _model.iAModalMobileModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: const IAModalMobileWidget(),
                    ).animateOnPageLoad(
                        animationsMap['iAModalMobileOnPageLoadAnimation']!),
                  if ((FFAppState().isShowIAPage == true) &&
                      responsiveVisibility(
                        context: context,
                        phone: false,
                      ))
                    wrapWithModel(
                      model: _model.iAModal2DesktopModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const IAModal2DesktopWidget(),
                    ).animateOnPageLoad(
                        animationsMap['iAModal2DesktopOnPageLoadAnimation']!),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
