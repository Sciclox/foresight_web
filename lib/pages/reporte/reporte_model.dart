import '/components/escenarios_section_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/reporte/agua/agua_widget.dart';
import '/reporte/dinero/dinero_widget.dart';
import '/reporte/iniciativas_desktop/iniciativas_desktop_widget.dart';
import '/reporte/iniciativas_mobile/iniciativas_mobile_widget.dart';
import '/reporte/nav_inferior_mobile/nav_inferior_mobile_widget.dart';
import '/reporte/nav_reporte_mobile/nav_reporte_mobile_widget.dart';
import '/reporte/urbanizacion/urbanizacion_widget.dart';
import 'reporte_widget.dart' show ReporteWidget;
import 'package:flutter/material.dart';

class ReporteModel extends FlutterFlowModel<ReporteWidget> {
  ///  Local state fields for this page.

  bool showButton = false;

  bool tendencia = false;

  bool escenario = false;

  bool iniciativa = false;

  int? index = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // Model for dinero component.
  late DineroModel dineroModel1;
  // Model for agua component.
  late AguaModel aguaModel1;
  // Model for urbanizacion component.
  late UrbanizacionModel urbanizacionModel1;
  // Model for dinero component.
  late DineroModel dineroModel2;
  // Model for agua component.
  late AguaModel aguaModel2;
  // Model for urbanizacion component.
  late UrbanizacionModel urbanizacionModel2;
  // Model for dinero component.
  late DineroModel dineroModel3;
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // Model for agua component.
  late AguaModel aguaModel3;
  // Model for urbanizacion component.
  late UrbanizacionModel urbanizacionModel3;
  // Model for dinero component.
  late DineroModel dineroModel4;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // State field(s) for SlideEscenarios widget.
  PageController? slideEscenariosController;

  int get slideEscenariosCurrentIndex => slideEscenariosController != null &&
          slideEscenariosController!.hasClients &&
          slideEscenariosController!.page != null
      ? slideEscenariosController!.page!.round()
      : 0;
  // Model for EscenariosDesktop.
  late EscenariosSectionModel escenariosDesktopModel;
  // Model for IniciativasMobile component.
  late IniciativasMobileModel iniciativasMobileModel;
  // Model for IniciativasDesktop component.
  late IniciativasDesktopModel iniciativasDesktopModel;
  // Model for NavReporteMobile component.
  late NavReporteMobileModel navReporteMobileModel;
  // Model for NavInferiorMobile component.
  late NavInferiorMobileModel navInferiorMobileModel;

  @override
  void initState(BuildContext context) {
    dineroModel1 = createModel(context, () => DineroModel());
    aguaModel1 = createModel(context, () => AguaModel());
    urbanizacionModel1 = createModel(context, () => UrbanizacionModel());
    dineroModel2 = createModel(context, () => DineroModel());
    aguaModel2 = createModel(context, () => AguaModel());
    urbanizacionModel2 = createModel(context, () => UrbanizacionModel());
    dineroModel3 = createModel(context, () => DineroModel());
    aguaModel3 = createModel(context, () => AguaModel());
    urbanizacionModel3 = createModel(context, () => UrbanizacionModel());
    dineroModel4 = createModel(context, () => DineroModel());
    escenariosDesktopModel =
        createModel(context, () => EscenariosSectionModel());
    iniciativasMobileModel =
        createModel(context, () => IniciativasMobileModel());
    iniciativasDesktopModel =
        createModel(context, () => IniciativasDesktopModel());
    navReporteMobileModel = createModel(context, () => NavReporteMobileModel());
    navInferiorMobileModel =
        createModel(context, () => NavInferiorMobileModel());
  }

  @override
  void dispose() {
    dineroModel1.dispose();
    aguaModel1.dispose();
    urbanizacionModel1.dispose();
    dineroModel2.dispose();
    aguaModel2.dispose();
    urbanizacionModel2.dispose();
    dineroModel3.dispose();
    aguaModel3.dispose();
    urbanizacionModel3.dispose();
    dineroModel4.dispose();
    escenariosDesktopModel.dispose();
    iniciativasMobileModel.dispose();
    iniciativasDesktopModel.dispose();
    navReporteMobileModel.dispose();
    navInferiorMobileModel.dispose();
  }
}
