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
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HeroDesktop component.
  late HeroDesktopModel heroDesktopModel;
  // Model for HeroMobile component.
  late HeroMobileModel heroMobileModel;
  // Model for QueHacemosMobile component.
  late QueHacemosMobileModel queHacemosMobileModel;
  // Model for QueHacemosDesktop component.
  late QueHacemosDesktopModel queHacemosDesktopModel;
  // Model for ComoLoHacemos1Desktop component.
  late ComoLoHacemos1DesktopModel comoLoHacemos1DesktopModel;
  // Model for PorQueLoHacemosMobile component.
  late PorQueLoHacemosMobileModel porQueLoHacemosMobileModel;
  // Model for ComoLoHacemos2Mobile component.
  late ComoLoHacemos2MobileModel comoLoHacemos2MobileModel;
  // Model for ComoLoHacemos3Mobile component.
  late ComoLoHacemos3MobileModel comoLoHacemos3MobileModel;
  // Model for ComoLoHacemos2Desktop component.
  late ComoLoHacemos2DesktopModel comoLoHacemos2DesktopModel;
  // Model for EcosistemaInternoDesktop component.
  late EcosistemaInternoDesktopModel ecosistemaInternoDesktopModel;
  // Model for EcosistemaInternoMobile1 component.
  late EcosistemaInternoMobile1Model ecosistemaInternoMobile1Model;
  // Model for EcosistemaInternoMobile2 component.
  late EcosistemaInternoMobile2Model ecosistemaInternoMobile2Model;
  // Model for EcosistemaInternoMobile3 component.
  late EcosistemaInternoMobile3Model ecosistemaInternoMobile3Model;
  // Model for EcosistemaInternoMobile4 component.
  late EcosistemaInternoMobile4Model ecosistemaInternoMobile4Model;
  // Model for footerDesktop component.
  late FooterDesktopModel footerDesktopModel;
  // Model for footerMobile component.
  late FooterMobileModel footerMobileModel;
  // Model for NavDesktop component.
  late NavDesktopModel navDesktopModel;
  // Model for NavMobile component.
  late NavMobileModel navMobileModel;
  // Model for MenuMobile component.
  late MenuMobileModel menuMobileModel;
  // Model for menuDesktop.
  late MenuDesktopModel menuDesktopModel;
  // Model for IAButtonDesktop component.
  late IAButtonDesktopModel iAButtonDesktopModel;
  // Model for IAButtonHoverDesktop component.
  late IAButtonHoverDesktopModel iAButtonHoverDesktopModel;
  // Model for IAButtonMobile component.
  late IAButtonMobileModel iAButtonMobileModel;
  // Model for IAModalDesktop component.
  late IAModalDesktopModel iAModalDesktopModel;
  // Model for IAModalMobile component.
  late IAModalMobileModel iAModalMobileModel;

  @override
  void initState(BuildContext context) {
    heroDesktopModel = createModel(context, () => HeroDesktopModel());
    heroMobileModel = createModel(context, () => HeroMobileModel());
    queHacemosMobileModel = createModel(context, () => QueHacemosMobileModel());
    queHacemosDesktopModel =
        createModel(context, () => QueHacemosDesktopModel());
    comoLoHacemos1DesktopModel =
        createModel(context, () => ComoLoHacemos1DesktopModel());
    porQueLoHacemosMobileModel =
        createModel(context, () => PorQueLoHacemosMobileModel());
    comoLoHacemos2MobileModel =
        createModel(context, () => ComoLoHacemos2MobileModel());
    comoLoHacemos3MobileModel =
        createModel(context, () => ComoLoHacemos3MobileModel());
    comoLoHacemos2DesktopModel =
        createModel(context, () => ComoLoHacemos2DesktopModel());
    ecosistemaInternoDesktopModel =
        createModel(context, () => EcosistemaInternoDesktopModel());
    ecosistemaInternoMobile1Model =
        createModel(context, () => EcosistemaInternoMobile1Model());
    ecosistemaInternoMobile2Model =
        createModel(context, () => EcosistemaInternoMobile2Model());
    ecosistemaInternoMobile3Model =
        createModel(context, () => EcosistemaInternoMobile3Model());
    ecosistemaInternoMobile4Model =
        createModel(context, () => EcosistemaInternoMobile4Model());
    footerDesktopModel = createModel(context, () => FooterDesktopModel());
    footerMobileModel = createModel(context, () => FooterMobileModel());
    navDesktopModel = createModel(context, () => NavDesktopModel());
    navMobileModel = createModel(context, () => NavMobileModel());
    menuMobileModel = createModel(context, () => MenuMobileModel());
    menuDesktopModel = createModel(context, () => MenuDesktopModel());
    iAButtonDesktopModel = createModel(context, () => IAButtonDesktopModel());
    iAButtonHoverDesktopModel =
        createModel(context, () => IAButtonHoverDesktopModel());
    iAButtonMobileModel = createModel(context, () => IAButtonMobileModel());
    iAModalDesktopModel = createModel(context, () => IAModalDesktopModel());
    iAModalMobileModel = createModel(context, () => IAModalMobileModel());
  }

  @override
  void dispose() {
    heroDesktopModel.dispose();
    heroMobileModel.dispose();
    queHacemosMobileModel.dispose();
    queHacemosDesktopModel.dispose();
    comoLoHacemos1DesktopModel.dispose();
    porQueLoHacemosMobileModel.dispose();
    comoLoHacemos2MobileModel.dispose();
    comoLoHacemos3MobileModel.dispose();
    comoLoHacemos2DesktopModel.dispose();
    ecosistemaInternoDesktopModel.dispose();
    ecosistemaInternoMobile1Model.dispose();
    ecosistemaInternoMobile2Model.dispose();
    ecosistemaInternoMobile3Model.dispose();
    ecosistemaInternoMobile4Model.dispose();
    footerDesktopModel.dispose();
    footerMobileModel.dispose();
    navDesktopModel.dispose();
    navMobileModel.dispose();
    menuMobileModel.dispose();
    menuDesktopModel.dispose();
    iAButtonDesktopModel.dispose();
    iAButtonHoverDesktopModel.dispose();
    iAButtonMobileModel.dispose();
    iAModalDesktopModel.dispose();
    iAModalMobileModel.dispose();
  }
}
