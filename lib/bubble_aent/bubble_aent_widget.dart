import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'bubble_aent_model.dart';
export 'bubble_aent_model.dart';

class BubbleAentWidget extends StatefulWidget {
  const BubbleAentWidget({super.key});

  static String routeName = 'BubbleAent';
  static String routePath = '/bubbleAent';

  @override
  State<BubbleAentWidget> createState() => _BubbleAentWidgetState();
}

class _BubbleAentWidgetState extends State<BubbleAentWidget> {
  late BubbleAentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BubbleAentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).accent1,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: const SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FlutterFlowWebView(
                  content:
                      '<link rel=\"stylesheet\" href=\"https://www.gstatic.com/dialogflow-console/fast/df-messenger/prod/v1/themes/df-messenger-default.css\">\n<script src=\"https://www.gstatic.com/dialogflow-console/fast/df-messenger/prod/v1/df-messenger.js\"></script>\n\n<df-messenger\n  location=\"us-central1\"\n  project-id=\"pe-pacasmayo-f5-gcp-dev\"\n  agent-id=\"a6775758-2762-4a96-b5d3-f445bdbe93bc\"\n  language-code=\"es\"\n  max-query-length=\"-1\"\n  chat-title=\"F5 Agent\"\n  placeholder=\"Introduce tus dudas sobre Foresight\"\n>\n  <df-messenger-chat-bubble\n    chat-title=\"Foresight · Ache\"\n  >\n  </df-messenger-chat-bubble>\n</df-messenger>\n\n<style>\n  df-messenger {\n    position: fixed;\n    z-index: 999;\n    bottom: 16px;\n    right: 16px;\n\n    /* Colores base */\n    --df-messenger-font-family: system-ui, -apple-system, BlinkMacSystemFont, \"Segoe UI\", sans-serif;\n    --df-messenger-font-color: #ffffff;\n\n    /* Fondo del chat */\n    --df-messenger-chat-background: #0A0716;\n\n    /* Mensajes */\n    --df-messenger-message-user-background: #9748FF;\n    --df-messenger-message-bot-background: #1A122E;\n\n    /* Header */\n    --df-messenger-titlebar-background: #0A0716;\n    --df-messenger-titlebar-font-color: #ffffff;\n\n    /* Input / hint */\n    --df-messenger-input-background: #120C22;\n    --df-messenger-input-font-color: #000000; /* ← TEXTO NEGRO EN EL INPUT */\n\n    /* Botón flotante */\n    --df-messenger-chat-button-background: #9748FF;\n    --df-messenger-chat-button-icon-color: #ffffff;\n  }\n</style>\n\n',
                  width: 500.0,
                  height: 400.0,
                  verticalScroll: true,
                  horizontalScroll: false,
                  html: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
