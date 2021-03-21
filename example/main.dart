import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'example.dart';

void main() async {
  // Downloading from WEB (has problem in the Web Platform)
  final String url =
      'https://images.unsplash.com/photo-1574231164645-d6f0e8553590?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1035&q=80';
  http.Response response = await http.get(Uri.parse(url));
  final Uint8List bytes = response.bodyBytes; //Uint8List

  final codec = await ui.instantiateImageCodec(bytes);
  final frame = await codec.getNextFrame();
  runApp(MaterialApp(
    home: ExampleScreen(frame.image),
  ));
}
