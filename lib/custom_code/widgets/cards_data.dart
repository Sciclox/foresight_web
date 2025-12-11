// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!


import 'dart:math' as math;

class CardsData extends StatefulWidget {
  const CardsData({
    super.key,
    this.width,
    this.height,
    required this.items,
    this.titleFontSize,
    this.contentFontSize,
  });

  final double? width;
  final double? height;
  final double? titleFontSize; // Tamaño de letra del título
  final double? contentFontSize; // Tamaño de letra del contenido
  final List<ItemsStruct> items; // Cada item tiene 'titulo' y 'contenido'

  @override
  State<CardsData> createState() => _CardsDataState();
}

class _CardsDataState extends State<CardsData>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0; // Índice de la tarjeta visible
  Offset _dragOffset = Offset.zero;
  double _opacity = 1.0;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.0, 1.0), // Diagonal hacia abajo-derecha
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (_currentIndex >= widget.items.length) return;

    setState(() {
      // Acumulamos el desplazamiento diagonal (abajo-derecha)
      _dragOffset += Offset(
        details.delta.dx * 0.5, // Movimiento horizontal reducido
        details.delta.dy * 0.5, // Movimiento vertical reducido
      );

      // Calculamos la distancia total del swipe
      final distance = math.sqrt(
        _dragOffset.dx * _dragOffset.dx + _dragOffset.dy * _dragOffset.dy,
      );
      const maxDistance = 200.0; // Distancia máxima para completar el swipe

      // Calculamos la opacidad basada en la distancia (desvanecimiento)
      _opacity = (1.0 - (distance / maxDistance).clamp(0.0, 1.0));
    });
  }

  void _onPanEnd(DragEndDetails details) {
    final distance = math.sqrt(
      _dragOffset.dx * _dragOffset.dx + _dragOffset.dy * _dragOffset.dy,
    );
    const threshold = 100.0; // Umbral mínimo para completar el swipe

    if (distance > threshold && _currentIndex < widget.items.length - 1) {
      // Completar la animación de swipe
      _animationController.forward().then((_) {
        setState(() {
          _currentIndex++;
          _dragOffset = Offset.zero;
          _opacity = 1.0;
        });
        _animationController.reset();
      });
    } else {
      // Volver a la posición original con animación
      _animationController.reverse().then((_) {
        setState(() {
          _dragOffset = Offset.zero;
          _opacity = 1.0;
        });
        _animationController.reset();
      });
    }
  }

  Widget _buildCard(ItemsStruct item, int index, bool isTop) {
    String content = item.contenido ?? '';
    if (content.length > 165) {
      content = '${content.substring(0, 165)}…';
    }

    final cardWidget = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0x87FFFFFF), // Container exterior
        borderRadius: BorderRadius.circular(54),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF555175), Color(0xFF2A264E)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(53),
              topRight: Radius.circular(56),
              bottomLeft: Radius.circular(56),
              bottomRight: Radius.circular(53),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item.titulo ?? '',
                  style: TextStyle(
                    fontFamily: 'Anek Latin',
                    color: const Color(0xFF00EAFF),
                    fontWeight: FontWeight.bold,
                    fontSize: widget.titleFontSize ?? 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  content,
                  style: TextStyle(
                    fontFamily: 'Anek Latin',
                    color: Colors.white,
                    fontSize: widget.contentFontSize ?? 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (!isTop) {
      // Tarjetas de fondo: escaladas y con offset
      final stackIndex = index - _currentIndex;
      final scale = 1.0 - (stackIndex * 0.05);
      final offset = stackIndex * 8.0;

      return Positioned.fill(
        child: Transform.scale(
          scale: scale.clamp(0.85, 1.0),
          child: Transform.translate(
            offset: Offset(offset, offset),
            child: Opacity(
              opacity: 0.7 - (stackIndex * 0.1),
              child: cardWidget,
            ),
          ),
        ),
      );
    }

    // Tarjeta superior: con animación de swipe
    return Positioned.fill(
      child: GestureDetector(
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            // Combinamos el drag manual con la animación
            final currentOffset = _animationController.isAnimating
                ? _slideAnimation.value * 200.0
                : _dragOffset;
            final currentOpacity = _animationController.isAnimating
                ? _fadeAnimation.value
                : _opacity;

            return Transform.translate(
              offset: currentOffset,
              child: Opacity(
                opacity: currentOpacity.clamp(0.0, 1.0),
                child: cardWidget,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 250,
          child: Stack(
            children: [
              // Tarjetas de fondo (apiladas)
              for (int i = _currentIndex + 1;
                  i < math.min(_currentIndex + 4, widget.items.length);
                  i++)
                _buildCard(widget.items[i], i, false),
              // Tarjeta superior (interactiva)
              if (_currentIndex < widget.items.length)
                _buildCard(widget.items[_currentIndex], _currentIndex, true),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Dots indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.items.length, (index) {
            bool isActive = index == _currentIndex;
            return Container(
              width: 12,
              height: 12,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive
                    ? const Color(0xFF00EAFF)
                    : const Color(0xFFD9D9D9),
              ),
            );
          }),
        ),
      ],
    );
  }
}
