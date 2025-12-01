import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int? suma1(int? numero) {
  // dame el numero mas 1
  return (numero ?? 0) + 1;
}

int? restar1(int? numero) {
  if (numero == null) return null;

  final resultado = numero - 1;

  return resultado < 0 ? 0 : resultado;
}
