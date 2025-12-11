// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_svg/flutter_svg.dart';

import 'package:just_audio/just_audio.dart';
import 'dart:ui';
import 'dart:math' as math;

class AudioWidget extends StatefulWidget {
  const AudioWidget({
    super.key,
    this.width,
    this.height,
    this.audio,
    this.autoPlay = false,
    this.showControls = true,
    this.title = '',
  });

  final double? width;
  final double? height;
  final String? audio;
  final bool autoPlay;
  final bool showControls;
  final String title;

  @override
  State<AudioWidget> createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget>
    with SingleTickerProviderStateMixin {
  late final AudioPlayer _player;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;
  ProcessingState _processingState = ProcessingState.idle;
  String? _errorMessage;

  // -----------------------
  // SVGs de Play/Pause
  // -----------------------
  final String _playSvg = '''
<svg width="16" height="21" viewBox="0 0 16 21" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0 20.4167V0L15.5833 10.2083L0 20.4167ZM2.83333 15.0938L10.2708 10.2083L2.83333 5.32292V15.0938Z" fill="#E3E3E3"/>
</svg>
''';

  final String _pauseSvg = '''
<svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M8 14V0H14V14H8ZM0 14V0H6V14H0ZM10 12H12V2H10V12ZM2 12H4V2H2V12Z" fill="#E3E3E3"/>
</svg>
''';

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    // Escucha cambios del estado del player
    _player.playerStateStream.listen((state) {
      setState(() {
        _isPlaying = state.playing;
        _processingState = state.processingState;
        // Cuando termina, mostramos Play
        if (state.processingState == ProcessingState.completed) {
          _isPlaying = false;
        }
      });
    });

    // Duración total
    _player.durationStream.listen((d) {
      setState(() => _duration = d ?? Duration.zero);
    });

    // Posición mientras avanza
    _player.positionStream.listen((p) {
      setState(() => _position = p);
    });

    // Errores
    _player.errorStream.listen((e) {
      setState(() {
        _errorMessage = '(${e.code}) ${e.message}';
      });
    });

    if ((widget.audio ?? '').isNotEmpty) {
      _load();
    }
  }

  Future<void> _load() async {
    try {
      await _player.setUrl(widget.audio!);
      await _player.setVolume(1.0);
      await _player.setSpeed(1.0);
      if (widget.autoPlay) await _player.play();
    } on PlayerException catch (e) {
      setState(
        () => _errorMessage = 'Load error: ${e.message} (code ${e.code})',
      );
    } on PlayerInterruptedException catch (e) {
      setState(() => _errorMessage = 'Interrupted: ${e.message}');
    } catch (e) {
      setState(() => _errorMessage = 'Unknown error: $e');
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final size = (widget.width ?? widget.height ?? 80.0);
    final isLoading = _processingState == ProcessingState.loading ||
        _processingState == ProcessingState.buffering;
    final showIcon = !isLoading;

    // Progreso 0..1
    final double playProgress = (_duration.inMilliseconds > 0)
        ? (_position.inMilliseconds / _duration.inMilliseconds).clamp(0.0, 1.0)
        : 0.0;

    return Container(
      width: widget.width,
      height: widget.height,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () async {
          if (isLoading) return;

          if (_isPlaying) {
            await _player.pause();
          } else {
            if (_processingState == ProcessingState.completed) {
              await _player.seek(Duration.zero);
            }
            if (_processingState == ProcessingState.idle &&
                (widget.audio ?? '').isNotEmpty) {
              await _load();
            }
            await _player.play();
          }
        },
        child: SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // ---------------------------
              // 1) Interior: gradiente (pausado) o glass/blur (reproduciendo)
              // ---------------------------
              if (!_isPlaying)
                ClipOval(
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const RadialGradient(
                        colors: [Color(0xFF272158), Color(0xFF22205B)],
                        focal: Alignment(0.0, -0.1),
                        radius: 0.9,
                      ),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.06),
                        width: 1.0,
                      ),
                    ),
                  ),
                )
              else
                ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: Container(
                      width: size,
                      height: size,
                      color: Colors.white.withOpacity(0.02), // Sutil cristal
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.04),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),

              // ---------------------------
              // 3) Progress arc (sólido). Se dibuja encima del hotspot.
              // ---------------------------
              if (playProgress > 0 && _duration.inMilliseconds > 0)
                CustomPaint(
                  size: Size(size, size),
                  painter: ProgressArcPainter(
                    progress: playProgress,
                    color: const Color(0xFF5EFFFF),
                  ),
                ),

              // ---------------------------
              // 4) Loading indicator (centrado)
              // ---------------------------
              if (isLoading)
                SizedBox(
                  width: size * 0.4,
                  height: size * 0.4,
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF5EFFFF),
                    ),
                  ),
                ),

              // ---------------------------
              // 5) Play/Pause icon
              // ---------------------------
              if (showIcon)
                Center(
                  child: SizedBox(
                    width: size * 0.4,
                    height: size * 0.4,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: SvgPicture.string(
                        _isPlaying ? _pauseSvg : _playSvg,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Painter del arco de progreso (sólido)
class ProgressArcPainter extends CustomPainter {
  final double progress; // Progreso entre 0 y 1
  final Color color;

  ProgressArcPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Radio del arco (un poco fuera del borde)
    final radius = size.width / 2 + 1;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    // Empieza desde arriba
    const startAngle = -math.pi / 2;

    // Recorrido completo multiplicado por el progreso
    final sweepAngle = -2 * math.pi * progress.clamp(0.0, 1.0);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(ProgressArcPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
