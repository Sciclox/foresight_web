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

import 'package:stacked_card_swiper/stacked_card_swiper.dart';
import '/custom_code/widgets/index.dart';

class CardsData2 extends StatefulWidget {
  const CardsData2({
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
  State<CardsData2> createState() => _CardsData2State();
}

class _CardsData2State extends State<CardsData2> {
  int _currentIndex = 0; // Índice de la tarjeta visible

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 250,
          child: StackedCardSwiper(
            values: widget.items,
            swipeAxis: Axis.vertical,
            onChanged: (item) {
              setState(() {
                _currentIndex =
                    widget.items.indexOf(item); // Obtenemos el índice
              });
            },
            builder: (context, item) {
              String content = item.contenido ?? '';
              if (content.length > 165) {
                content = content.substring(0, 165) + '…';
              }
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x87FFFFFF), // Container exterior
                  borderRadius: BorderRadius.circular(54),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF555175), Color(0xFF2A264E)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(53),
                        topRight: Radius.circular(56),
                        bottomLeft: Radius.circular(56),
                        bottomRight: Radius.circular(53),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            item.titulo ?? '',
                            style: FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'Anek Latin',
                                  color: Color(0xFF00EAFF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: widget.titleFontSize ?? 18,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            content,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
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
            },
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
                color: isActive ? Color(0xFF00EAFF) : Color(0xFFD9D9D9),
              ),
            );
          }),
        ),
      ],
    );
  }
}
