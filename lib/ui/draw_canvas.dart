import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:covid_tracker/business_logic/models/country_cases.dart';
import 'package:covid_tracker/ui/numberFormatter.dart';
import 'package:flutter/material.dart';

class Draw_Canvas{
  static Future<Uint8List> getBytesFromCanvas(int width, int height, Country_cases country_cases) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.redAccent;
    final Radius radius = Radius.circular(40.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: Radius.zero,
          bottomRight: radius,
        ),
        paint);
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: '${NumberFormatter.formatter(country_cases.Confirmed)} Corona Virus Cases.\n'
          '${NumberFormatter.formatter(country_cases.Recovered)} Recovered.\n'
          '${NumberFormatter.formatter(country_cases.Deaths)} Deaths.',
      style: TextStyle(fontSize: 25.0, color: Colors.white),
    );
    painter.layout();
    painter.paint(canvas, Offset((width * 0.5) - painter.width * 0.5, (height * 0.5) - painter.height * 0.5));
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data.buffer.asUint8List();
  }
}