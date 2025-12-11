import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'i_a_modal2_desktop_model.dart';
export 'i_a_modal2_desktop_model.dart';

class IAModal2DesktopWidget extends StatefulWidget {
  const IAModal2DesktopWidget({super.key});

  @override
  State<IAModal2DesktopWidget> createState() => _IAModal2DesktopWidgetState();
}

class _IAModal2DesktopWidgetState extends State<IAModal2DesktopWidget>
    with TickerProviderStateMixin {
  late IAModal2DesktopModel _model;
  bool _wasModalVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IAModal2DesktopModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
    _model.scrollController ??= ScrollController();

    // Inicializar AnimationController para la animación del video
    _model.videoAnimationController ??= AnimationController(
      duration: const Duration(
          milliseconds:
              1200), // Duración ligeramente mayor para transición más suave
      vsync: this,
    );

    // Animación de posición: desde el centro (0,0) hasta la posición del avatar (izquierda)
    // El cálculo se hará dinámicamente en el builder basándose en el ancho del contenedor
    // El contenedor tiene 828px de ancho, el avatar tiene 78px y está a la izquierda
    // Posición relativa: aproximadamente -0.45 del ancho del contenedor desde el centro
    _model.videoPositionAnimation ??= Tween<Offset>(
      begin: const Offset(0.0, 0.0), // Centro de la pantalla
      end: const Offset(-0.45,
          0.0), // Posición del avatar del bot (izquierda, misma altura vertical)
    ).animate(CurvedAnimation(
      parent: _model.videoAnimationController!,
      curve: Curves.easeInOutCubic, // Curva más suave para la transición
    ));

    // Animación de escala: desde 2.5x hasta 1.0x
    _model.videoScaleAnimation ??= Tween<double>(
      begin: 2.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _model.videoAnimationController!,
      curve: Curves.easeInOutCubic, // Curva más suave para la transición
    ));

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: null,
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    // Resetear el estado cuando el widget se crea (modal se muestra)
    // Esto asegura que cada vez que el modal se abre, empieza con un estado limpio
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _model.resetState();
      _wasModalVisible = FFAppState().isShowIAPage;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Detectar cuando el modal se vuelve a mostrar después de estar oculto
    final isModalVisible = FFAppState().isShowIAPage;
    if (isModalVisible && !_wasModalVisible) {
      // El modal acaba de mostrarse, resetear el estado
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _model.resetState();
        }
      });
    }
    _wasModalVisible = isModalVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF0A0716),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).width * 0.076,
                      0.0,
                    ),
                    scaleDesktopHeight(28.0, context),
                    valueOrDefault<double>(
                      MediaQuery.sizeOf(context).width * 0.076,
                      0.0,
                    ),
                    scaleDesktopHeight(28.0, context)),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(scaleDesktop(8.0, context)),
                      child: SvgPicture.asset(
                        'assets/images/Logo_F5.svg',
                        width: scaleDesktop(64.0, context),
                        height: scaleDesktop(64.0, context),
                        fit: BoxFit.cover,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderRadius: scaleDesktop(8.0, context),
                      icon: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).info,
                        size: scaleDesktop(32.0, context),
                      ),
                      onPressed: () async {
                        if (animationsMap[
                                'containerOnActionTriggerAnimation1'] !=
                            null) {
                          await animationsMap[
                                  'containerOnActionTriggerAnimation1']!
                              .controller
                              .forward(from: 0.0);
                        }
                        await Future.delayed(
                          const Duration(
                            milliseconds: 600,
                          ),
                        );
                        // Resetear el estado del modelo antes de cerrar
                        _model.resetState();
                        FFAppState().isShowIAPage = false;
                        safeSetState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: scaleDesktop(828.0, context),
                constraints: BoxConstraints(
                  maxWidth: scaleDesktop(828.0, context),
                ),
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Stack(
                        key: _model.stackKey,
                        children: [
                          // Video centrado inicial (solo cuando no hay mensajes o está animando)
                          // Se muestra mientras no haya mensajes O mientras esté animando hacia su posición final
                          if ((_model.iamensajes.isEmpty ||
                                  _model.isAnimatingVideo) &&
                              !_model.hasAnimatedVideo)
                            AnimatedBuilder(
                              animation: _model.videoAnimationController!,
                              builder: (context, child) {
                                // Obtener las animaciones
                                final position =
                                    _model.videoPositionAnimation?.value ??
                                        const Offset(0.0, 0.0);
                                final scale =
                                    _model.videoScaleAnimation?.value ?? 2.5;

                                // Obtener las coordenadas reales del avatar usando GlobalKey
                                // Esto asegura que el video siempre se posicione correctamente
                                // sin importar el tamaño del mensaje del usuario
                                Offset? avatarCenter;
                                Offset? stackCenter;

                                // Obtener las coordenadas del avatar
                                final avatarRenderBox = _model
                                    .avatarKey.currentContext
                                    ?.findRenderObject() as RenderBox?;
                                final stackRenderBox = _model
                                    .stackKey.currentContext
                                    ?.findRenderObject() as RenderBox?;

                                if (avatarRenderBox != null &&
                                    stackRenderBox != null) {
                                  // Obtener la posición global del avatar
                                  final avatarPosition = avatarRenderBox
                                      .localToGlobal(Offset.zero);
                                  // Obtener la posición global del Stack
                                  final stackPosition =
                                      stackRenderBox.localToGlobal(Offset.zero);

                                  // Calcular el centro del avatar
                                  final avatarSize = avatarRenderBox.size;
                                  avatarCenter = Offset(
                                    avatarPosition.dx -
                                        stackPosition.dx +
                                        avatarSize.width / 2,
                                    avatarPosition.dy -
                                        stackPosition.dy +
                                        avatarSize.height / 2,
                                  );

                                  // Calcular el centro del Stack
                                  final stackSize = stackRenderBox.size;
                                  stackCenter = Offset(
                                    stackSize.width / 2,
                                    stackSize.height / 2,
                                  );
                                }

                                // Si no podemos obtener las coordenadas, usar cálculo por defecto
                                final containerWidth =
                                    scaleDesktop(828.0, context);
                                final avatarWidth = scaleDesktop(78.0, context);
                                final avatarHeight =
                                    scaleDesktop(78.0, context);
                                final textPaddingTop =
                                    scaleDesktop(27.0, context);

                                // Posición inicial: centro del Stack
                                final startX =
                                    stackCenter?.dx ?? (containerWidth / 2);
                                final startY = stackCenter?.dy ?? 0.0;

                                // Posición final: centro del avatar
                                final endX =
                                    avatarCenter?.dx ?? (avatarWidth / 2);
                                final endY = avatarCenter?.dy ??
                                    (-(textPaddingTop + avatarHeight / 2) +
                                        scaleDesktop(-123.0, context));

                                // Calcular el desplazamiento necesario
                                final offsetX = endX - startX;
                                final offsetY = endY - startY;

                                // Interpolar usando el progreso de la animación
                                // position.dx va de 0.0 (inicio) a -0.45 (fin)
                                final animationProgress =
                                    (-position.dx / 0.45).clamp(0.0, 1.0);

                                // Aplicar la interpolación con easing para suavizar
                                final easedProgress = Curves.easeInOutCubic
                                    .transform(animationProgress);
                                final currentOffsetX = offsetX * easedProgress;
                                final currentOffsetY = offsetY * easedProgress;

                                // Usar Transform.translate para mover el video desde el centro
                                return Positioned.fill(
                                  child: Center(
                                    child: Transform.translate(
                                      offset: Offset(
                                          currentOffsetX, currentOffsetY),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Transform.scale(
                                            scale: scale,
                                            child: Container(
                                              width:
                                                  scaleDesktop(100.0, context),
                                              height:
                                                  scaleDesktop(100.0, context),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: scaleDesktop(
                                                        400.0, context),
                                                    color:
                                                        const Color(0xFF0A0716),
                                                    offset: Offset(
                                                      scaleDesktop(
                                                          20.0, context),
                                                      scaleDesktop(
                                                          200.0, context),
                                                    ),
                                                    spreadRadius: scaleDesktop(
                                                        300.0, context),
                                                  )
                                                ],
                                              ),
                                              child: ClipOval(
                                                child: Container(
                                                  width: scaleDesktop(
                                                      120.0, context),
                                                  height: scaleDesktop(
                                                      120.0, context),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF0A0716),
                                                    image: DecorationImage(
                                                      fit: BoxFit.contain,
                                                      image: Image.asset(
                                                        'assets/images/iapage.gif',
                                                      ).image,
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      ClipOval(
                                                        child: SvgPicture.asset(
                                                          'assets/images/circleblur_-_v03.svg',
                                                          fit: BoxFit.contain,
                                                          width: scaleDesktop(
                                                              120.0, context),
                                                          height: scaleDesktop(
                                                              120.0, context),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Texto debajo del video (solo visible cuando no hay mensajes)
                                          if (_model.iamensajes.isEmpty)
                                            Opacity(
                                              opacity: _model.hasAnimatedVideo
                                                  ? 0.0
                                                  : 1.0,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0,
                                                        scaleDesktopHeight(
                                                            40.0, context),
                                                        0.0,
                                                        0.0),
                                                child: SizedBox(
                                                  width: scaleDesktop(
                                                      828.0, context),
                                                  child: GradientText(
                                                    'Hola, soy Ache tu asistente de foresight para explorar futuros posibles',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .anekLatin(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize:
                                                              scaleDesktop(50.0,
                                                                  context),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                    colors: const [
                                                      Color(0xFF3350F9),
                                                      Color(0xFFCD6549)
                                                    ],
                                                    gradientDirection:
                                                        GradientDirection.ltr,
                                                    gradientType:
                                                        GradientType.linear,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          Builder(
                            builder: (context) {
                              final mensajesIA = _model.iamensajes.toList();

                              return ListView.builder(
                                controller: _model.scrollController,
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  0,
                                  scaleDesktopHeight(32.0, context),
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: mensajesIA.length,
                                itemBuilder: (context, mensajesIAIndex) {
                                  final mensajesIAItem =
                                      mensajesIA[mensajesIAIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  0.0,
                                                  0.0,
                                                  scaleDesktopHeight(
                                                      32.0, context)),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                  scaleDesktop(50.0, context)),
                                              bottomRight:
                                                  const Radius.circular(0.0),
                                              topLeft: Radius.circular(
                                                  scaleDesktop(50.0, context)),
                                              topRight: Radius.circular(
                                                  scaleDesktop(50.0, context)),
                                            ),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: scaleDesktop(
                                                    500.0, context),
                                              ),
                                              decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Color(0xFF6671E5),
                                                    Color(0xFF4852D9)
                                                  ],
                                                  stops: [0.0, 1.0],
                                                  begin: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                      scaleDesktop(
                                                          50.0, context)),
                                                  bottomRight:
                                                      const Radius.circular(
                                                          0.0),
                                                  topLeft: Radius.circular(
                                                      scaleDesktop(
                                                          50.0, context)),
                                                  topRight: Radius.circular(
                                                      scaleDesktop(
                                                          50.0, context)),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    scaleDesktop(
                                                        24.0, context)),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        mensajesIAItem
                                                            .usuarioMensaje,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .anekLatin(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      scaleDesktop(
                                                                          22.0,
                                                                          context),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0,
                                            0.0,
                                            0.0,
                                            scaleDesktopHeight(32.0, context)),
                                        child: Container(
                                          decoration: const BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // El avatar siempre está presente pero con opacidad 0 durante la animación
                                              // Esto mantiene el espacio ocupado para que el texto no se desplace
                                              Opacity(
                                                opacity: _model.hasAnimatedVideo
                                                    ? 1.0
                                                    : 0.0,
                                                child: Container(
                                                  key: _model.avatarKey,
                                                  width: scaleDesktop(
                                                      78.0, context),
                                                  height: scaleDesktop(
                                                      78.0, context),
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child: Stack(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        ClipOval(
                                                          child: Container(
                                                            width: scaleDesktop(
                                                                78.0, context),
                                                            height:
                                                                scaleDesktop(
                                                                    78.0,
                                                                    context),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFF0A0716),
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    Image.asset(
                                                                  'assets/images/iapage.gif',
                                                                ).image,
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      scaleDesktop(
                                                                          400.0,
                                                                          context),
                                                                  color: const Color(
                                                                      0xFF0A0716),
                                                                  offset:
                                                                      Offset(
                                                                    scaleDesktop(
                                                                        20.0,
                                                                        context),
                                                                    scaleDesktop(
                                                                        200.0,
                                                                        context),
                                                                  ),
                                                                  spreadRadius:
                                                                      scaleDesktop(
                                                                          300.0,
                                                                          context),
                                                                )
                                                              ],
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                          ),
                                                        ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'containerOnActionTriggerAnimation2']!,
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Container(
                                                            width: scaleDesktop(
                                                                78.0, context),
                                                            height:
                                                                scaleDesktop(
                                                                    78.0,
                                                                    context),
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/circleblur_-_v03.svg',
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              0.0,
                                                              scaleDesktop(27.0,
                                                                  context),
                                                              scaleDesktop(24.0,
                                                                  context),
                                                              0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      // Obtener el texto a mostrar (typing o completo)
                                                      final isTyping = _model
                                                              .typingTimers
                                                              .containsKey(
                                                                  mensajesIAIndex) &&
                                                          _model.typingTimers[
                                                                  mensajesIAIndex] !=
                                                              null;
                                                      final displayText = isTyping
                                                          ? (_model.typingTexts[
                                                                  mensajesIAIndex] ??
                                                              '')
                                                          : mensajesIAItem
                                                              .botMensaje;
                                                      // Mostrar "Respondiendo...." solo si no hay texto para mostrar Y está cargando
                                                      final isRespondiendo = displayText
                                                              .isEmpty &&
                                                          (_model.isLoadingResponse &&
                                                              mensajesIAIndex ==
                                                                  _model.iamensajes
                                                                          .length -
                                                                      1);

                                                      return Stack(
                                                        children: [
                                                          if (displayText
                                                              .isNotEmpty)
                                                            Text(
                                                              displayText,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .anekLatin(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        scaleDesktop(
                                                                            22.0,
                                                                            context),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          if (isRespondiendo)
                                                            Text(
                                                              'Respondiendo....',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .anekLatin(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        scaleDesktop(
                                                                            22.0,
                                                                            context),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(
                                                width: scaleDesktop(
                                                    23.0, context))),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              width: double.infinity,
                              height: scaleDesktopHeight(250.0, context),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0x000A0716),
                                    Color(0xFF0A0716)
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(0.0, -1.0),
                                  end: AlignmentDirectional(0, 1.0),
                                ),
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].addToStart(
                      SizedBox(height: scaleDesktopHeight(50.0, context))),
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: scaleDesktop(828.0, context),
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF0A0716),
                boxShadow: [
                  BoxShadow(
                    blurRadius: scaleDesktop(10.0, context),
                    color: const Color(0x4BFFFFFF),
                    offset: const Offset(
                      0.0,
                      0.0,
                    ),
                    spreadRadius: scaleDesktop(2.0, context),
                  )
                ],
                borderRadius:
                    BorderRadius.circular(scaleDesktop(999.0, context)),
                border: Border.all(
                  color: (_model.textFieldFocusNode?.hasFocus ?? false) == false
                      ? const Color(0xFF9E99B6)
                      : FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    scaleDesktop(10.0, context),
                    scaleDesktop(10.0, context),
                    scaleDesktop(10.0, context),
                    scaleDesktop(10.0, context)),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: SizedBox(
                          width: scaleDesktop(828.0, context),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            inputFormatters: [
                              TextInputFormatter.withFunction(
                                  (oldValue, newValue) {
                                if (newValue.text.isEmpty) {
                                  return newValue;
                                }
                                // Capitalizar la primera letra si es el inicio del texto
                                String text = newValue.text;
                                if (oldValue.text.isEmpty && text.isNotEmpty) {
                                  text = text[0].toUpperCase() +
                                      (text.length > 1
                                          ? text.substring(1)
                                          : '');
                                  return TextEditingValue(
                                    text: text,
                                    selection: TextSelection.collapsed(
                                        offset: newValue.selection.baseOffset),
                                  );
                                }
                                return newValue;
                              }),
                            ],
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              const Duration(milliseconds: 100),
                              () => safeSetState(() {}),
                            ),
                            onFieldSubmitted: (_) async {
                              if (!_model.isLoadingResponse &&
                                  _model.textController?.text.isNotEmpty ==
                                      true) {
                                final userMessage = _model.textController!.text;

                                // Verificar si es el primer mensaje para animar el video
                                final isFirstMessage =
                                    _model.iamensajes.isEmpty;

                                // Si es el primer mensaje, activar la animación del video ANTES de agregar el mensaje
                                if (isFirstMessage &&
                                    !_model.hasAnimatedVideo) {
                                  safeSetState(() {
                                    _model.isAnimatingVideo = true;
                                  });

                                  // Iniciar la animación inmediatamente
                                  void statusListener(AnimationStatus status) {
                                    if (status == AnimationStatus.completed) {
                                      safeSetState(() {
                                        _model.hasAnimatedVideo = true;
                                        _model.isAnimatingVideo = false;
                                      });
                                      _model.videoAnimationController
                                          ?.removeStatusListener(
                                              statusListener);
                                    }
                                  }

                                  _model.videoAnimationController
                                      ?.addStatusListener(statusListener);
                                  _model.videoAnimationController
                                      ?.forward(from: 0.0);
                                }

                                // Agregar mensaje del usuario después de iniciar la animación
                                _model.addToIamensajes(IAModadlStruct(
                                  usuarioMensaje: userMessage,
                                  botMensaje:
                                      '', // Mensaje vacío mientras se carga
                                ));

                                safeSetState(() {
                                  _model.textController?.clear();
                                  _model.isLoadingResponse = true;
                                });

                                _model.agentResponse = await AgentAPICall.call(
                                  token: currentJwtToken,
                                  sessionId: currentUserEmail,
                                  message: userMessage,
                                );

                                if ((_model.agentResponse?.succeeded ?? true)) {
                                  // Actualizar el último mensaje con la respuesta del bot
                                  final botResponse = AgentAPICall.response(
                                        (_model.agentResponse?.jsonBody ?? ''),
                                      ) ??
                                      '';

                                  if (_model.iamensajes.isNotEmpty) {
                                    final lastIndex =
                                        _model.iamensajes.length - 1;
                                    // Guardar la respuesta completa en el mensaje (para referencia)
                                    _model.updateIamensajesAtIndex(lastIndex,
                                        (item) {
                                      return IAModadlStruct(
                                        usuarioMensaje: item.usuarioMensaje,
                                        botMensaje:
                                            botResponse, // Guardar respuesta completa
                                      );
                                    });

                                    // Iniciar animación de typing palabra por palabra
                                    // El loading se ocultará cuando aparezca la primera palabra
                                    _model.startTypingAnimation(
                                        lastIndex, botResponse, () {
                                      safeSetState(() {});
                                    });
                                  } else {
                                    safeSetState(() {
                                      _model.isLoadingResponse = false;
                                    });
                                  }
                                } else {
                                  safeSetState(() {
                                    _model.isLoadingResponse = false;
                                  });
                                }

                                safeSetState(() {});
                              }
                            },
                            autofocus: false,
                            enabled: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              hintText: 'Introduce tus dudas sobre Foresight',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.anekLatin(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: const Color(0xFF9E99B6),
                                    fontSize: scaleDesktop(20.0, context),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0x00000000),
                                  width: scaleDesktop(1.0, context),
                                ),
                                borderRadius: BorderRadius.circular(
                                    scaleDesktop(9999.0, context)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0x00000000),
                                  width: scaleDesktop(1.0, context),
                                ),
                                borderRadius: BorderRadius.circular(
                                    scaleDesktop(9999.0, context)),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0x00000000),
                                  width: scaleDesktop(1.0, context),
                                ),
                                borderRadius: BorderRadius.circular(
                                    scaleDesktop(9999.0, context)),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0x00000000),
                                  width: scaleDesktop(1.0, context),
                                ),
                                borderRadius: BorderRadius.circular(
                                    scaleDesktop(9999.0, context)),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.anekLatin(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: const Color(0xFFF8F8F8),
                                  fontSize: scaleDesktop(20.0, context),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            cursorColor: FlutterFlowTheme.of(context).alternate,
                            enableInteractiveSelection: true,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    if (!_model.isLoadingResponse &&
                        ((_model.textFieldFocusNode?.hasFocus ?? false) ||
                            (_model.textController?.text.isNotEmpty ?? false)))
                      Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderRadius: scaleDesktop(999.0, context),
                          fillColor: const Color(0xFF9748FF),
                          icon: Icon(
                            Icons.send,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: scaleDesktop(24.0, context),
                          ),
                          onPressed: () async {
                            final userMessage = _model.textController.text;

                            // Verificar si es el primer mensaje para animar el video
                            final isFirstMessage = _model.iamensajes.isEmpty;

                            // Si es el primer mensaje, activar la animación del video ANTES de agregar el mensaje
                            if (isFirstMessage && !_model.hasAnimatedVideo) {
                              safeSetState(() {
                                _model.isAnimatingVideo = true;
                              });

                              // Iniciar la animación inmediatamente
                              void statusListener(AnimationStatus status) {
                                if (status == AnimationStatus.completed) {
                                  safeSetState(() {
                                    _model.hasAnimatedVideo = true;
                                    _model.isAnimatingVideo = false;
                                  });
                                  _model.videoAnimationController
                                      ?.removeStatusListener(statusListener);
                                }
                              }

                              _model.videoAnimationController
                                  ?.addStatusListener(statusListener);
                              _model.videoAnimationController
                                  ?.forward(from: 0.0);
                            }

                            // Agregar mensaje del usuario después de iniciar la animación
                            _model.addToIamensajes(IAModadlStruct(
                              usuarioMensaje: userMessage,
                              botMensaje: '', // Mensaje vacío mientras se carga
                            ));

                            safeSetState(() {
                              _model.textController?.clear();
                              _model.isLoadingResponse = true;
                            });

                            // Hacer scroll hacia abajo después de agregar el mensaje
                            Future.delayed(const Duration(milliseconds: 150),
                                () {
                              if (_model.scrollController?.hasClients ??
                                  false) {
                                final maxScroll = _model
                                    .scrollController!.position.maxScrollExtent;
                                _model.scrollController
                                    ?.jumpTo(maxScroll + 100);
                              }
                            });

                            _model.agentResponse = await AgentAPICall.call(
                              token: currentJwtToken,
                              sessionId: currentUserEmail,
                              message: userMessage,
                            );

                            if ((_model.agentResponse?.succeeded ?? true)) {
                              // Actualizar el último mensaje con la respuesta del bot
                              final botResponse = AgentAPICall.response(
                                    (_model.agentResponse?.jsonBody ?? ''),
                                  ) ??
                                  '';

                              if (_model.iamensajes.isNotEmpty) {
                                final lastIndex = _model.iamensajes.length - 1;
                                // Guardar la respuesta completa en el mensaje (para referencia)
                                _model.updateIamensajesAtIndex(lastIndex,
                                    (item) {
                                  return IAModadlStruct(
                                    usuarioMensaje: item.usuarioMensaje,
                                    botMensaje:
                                        botResponse, // Guardar respuesta completa
                                  );
                                });

                                // Iniciar animación de typing palabra por palabra
                                // El loading se ocultará cuando aparezca la primera palabra
                                _model.startTypingAnimation(
                                    lastIndex, botResponse, () {
                                  safeSetState(() {});
                                  // Hacer scroll hacia abajo mientras se escribe
                                  Future.delayed(
                                      const Duration(milliseconds: 80), () {
                                    if (_model.scrollController?.hasClients ??
                                        false) {
                                      final maxScroll = _model.scrollController!
                                          .position.maxScrollExtent;
                                      _model.scrollController
                                          ?.jumpTo(maxScroll + 100);
                                    }
                                  });
                                });

                                // Hacer scroll inicial cuando llega la respuesta
                                Future.delayed(
                                    const Duration(milliseconds: 150), () {
                                  if (_model.scrollController?.hasClients ??
                                      false) {
                                    final maxScroll = _model.scrollController!
                                        .position.maxScrollExtent;
                                    _model.scrollController
                                        ?.jumpTo(maxScroll + 100);
                                  }
                                });
                              } else {
                                safeSetState(() {
                                  _model.isLoadingResponse = false;
                                });
                              }
                            } else {
                              safeSetState(() {
                                _model.isLoadingResponse = false;
                              });
                            }

                            safeSetState(() {});
                          },
                        ),
                      ),
                  ].divide(SizedBox(width: scaleDesktop(10.0, context))),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0.0,
                  scaleDesktopHeight(40.0, context),
                  0.0,
                  scaleDesktopHeight(60.0, context)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Text(
                      'Foresight no usara tus conversaciones',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.anekLatin(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: const Color(0xFF9E99B6),
                            fontSize: scaleDesktop(16.0, context),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ).animateOnActionTrigger(
        animationsMap['containerOnActionTriggerAnimation1']!,
        effects: [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
            end: Offset(0.0, MediaQuery.sizeOf(context).height),
          ),
        ],
      ),
    );
  }
}
