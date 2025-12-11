import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'i_a_modal2_desktop_widget.dart' show IAModal2DesktopWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class IAModal2DesktopModel extends FlutterFlowModel<IAModal2DesktopWidget> {
  ///  Local state fields for this component.

  List<IAModadlStruct> iamensajes = [];
  void addToIamensajes(IAModadlStruct item) => iamensajes.add(item);
  void removeFromIamensajes(IAModadlStruct item) => iamensajes.remove(item);
  void removeAtIndexFromIamensajes(int index) => iamensajes.removeAt(index);
  void insertAtIndexInIamensajes(int index, IAModadlStruct item) =>
      iamensajes.insert(index, item);
  void updateIamensajesAtIndex(int index, Function(IAModadlStruct) updateFn) =>
      iamensajes[index] = updateFn(iamensajes[index]);
  
  bool isLoadingResponse = false;
  
  // Para el efecto de typing palabra por palabra
  Map<int, String> typingTexts = {}; // Índice del mensaje -> texto que se está mostrando
  Map<int, Timer?> typingTimers = {}; // Índice del mensaje -> timer activo
  
  // Para la animación del video inicial
  bool hasAnimatedVideo = false;
  bool isAnimatingVideo = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Agent API)] action in IconButton widget.
  ApiCallResponse? agentResponse;
  
  // ScrollController para el ListView de mensajes
  ScrollController? scrollController;
  
  // AnimationController para la animación del video inicial
  AnimationController? videoAnimationController;
  Animation<Offset>? videoPositionAnimation;
  Animation<double>? videoScaleAnimation;
  
  // GlobalKey para obtener las coordenadas del avatar del bot
  final GlobalKey avatarKey = GlobalKey();
  final GlobalKey stackKey = GlobalKey();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    // Cancelar todos los timers de typing
    for (var timer in typingTimers.values) {
      timer?.cancel();
    }
    typingTimers.clear();
    
    textFieldFocusNode?.dispose();
    textController?.dispose();
    scrollController?.dispose();
    videoAnimationController?.dispose();
  }
  
  void startTypingAnimation(int messageIndex, String fullText, VoidCallback onUpdate) {
    // Cancelar timer existente si hay uno
    typingTimers[messageIndex]?.cancel();
    
    typingTexts[messageIndex] = '';
    final words = fullText.split(' ');
    int currentWordIndex = 0;
    
    typingTimers[messageIndex] = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (currentWordIndex < words.length) {
        final currentText = currentWordIndex == 0
            ? words[0]
            : '${typingTexts[messageIndex]} ${words[currentWordIndex]}';
        typingTexts[messageIndex] = currentText;
        currentWordIndex++;
        
        // Si es la primera palabra, ocultar el loading
        if (currentWordIndex == 1) {
          isLoadingResponse = false;
        }
        
        onUpdate(); // Notificar que se actualice el UI
      } else {
        timer.cancel();
        typingTimers.remove(messageIndex);
        isLoadingResponse = false;
        onUpdate(); // Última actualización para mostrar el texto completo
      }
    });
  }
  
  void resetState() {
    // Cancelar todos los timers de typing
    for (var timer in typingTimers.values) {
      timer?.cancel();
    }
    typingTimers.clear();
    typingTexts.clear();
    
    // Resetear mensajes
    iamensajes.clear();
    
    // Resetear flags de estado
    isLoadingResponse = false;
    hasAnimatedVideo = false;
    isAnimatingVideo = false;
    
    // Resetear el AnimationController
    videoAnimationController?.reset();
    
    // Limpiar el texto del controlador
    textController?.clear();
  }
}
