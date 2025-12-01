// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class ScrollPositionWidget extends StatefulWidget {
  const ScrollPositionWidget({
    Key? key,
    this.child,
    this.onScrollUpdate,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.physics,
    this.width,
    this.height,
  }) : super(key: key);

  final Widget? child;
  final VoidCallback? onScrollUpdate;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollPhysics? physics;

  // 👇 nuevos parámetros
  final double? width;
  final double? height;

  @override
  _ScrollPositionWidgetState createState() => _ScrollPositionWidgetState();
}

class _ScrollPositionWidgetState extends State<ScrollPositionWidget> {
  late ScrollController _scrollController;
  bool _isInitialized = false;
  double _lastAppStatePosition = 0.0;
  bool _isUpdatingFromAppState = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Inicializar la posición del scroll desde el app state si existe
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeScrollPosition();
      _syncFromAppState();
    });

    // Listener para actualizar el app state cuando cambie la posición del scroll
    _scrollController.addListener(_onScroll);
  }

  void _initializeScrollPosition() {
    if (!_isInitialized && _scrollController.hasClients) {
      try {
        final savedPosition = FFAppState().scrollPosition;
        _lastAppStatePosition = savedPosition;
        if (savedPosition > 0 &&
            savedPosition <= _scrollController.position.maxScrollExtent) {
          _isUpdatingFromAppState = true;
          _scrollController.jumpTo(savedPosition);
          _isUpdatingFromAppState = false;
        }
      } catch (e) {
        // Si scrollPosition no existe en el app state, se inicializa en 0
        debugPrint('Error al inicializar scroll position: $e');
      }
      setState(() {
        _isInitialized = true;
      });
    }
  }

  void _syncFromAppState() {
    // Sincronizar desde el app state si cambió externamente
    if (_scrollController.hasClients && !_isUpdatingFromAppState) {
      try {
        final appStatePosition = FFAppState().scrollPosition;
        final currentPosition = _scrollController.position.pixels;

        // Solo actualizar si el app state cambió y es diferente a la posición actual
        if ((appStatePosition - currentPosition).abs() > 1.0 &&
            appStatePosition != _lastAppStatePosition) {
          final maxScroll = _scrollController.position.maxScrollExtent;
          final targetPosition = appStatePosition.clamp(0.0, maxScroll);

          if ((targetPosition - currentPosition).abs() > 1.0) {
            _isUpdatingFromAppState = true;
            _scrollController.jumpTo(targetPosition);
            _isUpdatingFromAppState = false;
            _lastAppStatePosition = appStatePosition;
          }
        }
      } catch (e) {
        debugPrint('Error al sincronizar desde app state: $e');
      }
    }
  }

  void _onScroll() {
    if (_scrollController.hasClients && !_isUpdatingFromAppState) {
      final currentPosition = _scrollController.position.pixels;

      // Actualizar el app state solo si no estamos actualizando desde el app state
      try {
        FFAppState().update(() {
          FFAppState().scrollPosition = currentPosition;
        });
        _lastAppStatePosition = currentPosition;
      } catch (e) {
        debugPrint('Error al actualizar scroll position en app state: $e');
      }

      // Llamar al callback si existe
      widget.onScrollUpdate?.call();
    }
  }

  // Método para actualizar la posición del scroll programáticamente
  void updateScrollPosition(double position) {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final targetPosition = position.clamp(0.0, maxScroll);
      _scrollController.jumpTo(targetPosition);
    }
  }

  // Método para obtener la posición actual del scroll
  double getCurrentScrollPosition() {
    if (_scrollController.hasClients) {
      return _scrollController.position.pixels;
    }
    return 0.0;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeScrollPosition();
      _syncFromAppState();
    });

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = MediaQuery.of(context).size.height;
        return SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          physics: widget.physics,
          reverse: widget.reverse,
          child: Container(
            width: constraints.maxWidth,
            height: screenHeight * 5, // ← 5 veces la altura de la ventana
            color: const Color(0xFF10092D),
            child: widget.child ?? const SizedBox(),
          ),
        );
      },
    );
  }
}
