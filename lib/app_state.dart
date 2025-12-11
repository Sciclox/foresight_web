import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _datosEjemplos = prefs
              .getStringList('ff_datosEjemplos')
              ?.map((x) {
                try {
                  return ItemsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _datosEjemplos;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _image1 = false;
  bool get image1 => _image1;
  set image1(bool value) {
    _image1 = value;
  }

  bool _image2 = false;
  bool get image2 => _image2;
  set image2(bool value) {
    _image2 = value;
  }

  bool _image3 = false;
  bool get image3 => _image3;
  set image3(bool value) {
    _image3 = value;
  }

  bool _image4 = false;
  bool get image4 => _image4;
  set image4(bool value) {
    _image4 = value;
  }

  bool _iaShow = false;
  bool get iaShow => _iaShow;
  set iaShow(bool value) {
    _iaShow = value;
  }

  bool _iaShowReverse = false;
  bool get iaShowReverse => _iaShowReverse;
  set iaShowReverse(bool value) {
    _iaShowReverse = value;
  }

  bool _showMenu = false;
  bool get showMenu => _showMenu;
  set showMenu(bool value) {
    _showMenu = value;
  }

  bool _isShowIAPage = false;
  bool get isShowIAPage => _isShowIAPage;
  set isShowIAPage(bool value) {
    if (_isShowIAPage != value) {
      _isShowIAPage = value;
      notifyListeners();
    }
  }

  double _scrollPosition = 0.0;
  double get scrollPosition => _scrollPosition;
  set scrollPosition(double value) {
    _scrollPosition = value;
  }

  List<ItemsStruct> _datosEjemplos = [
    ItemsStruct.fromSerializableMap(jsonDecode(
        '{\"titulo\":\"Hello World1\",\"contenido\":\"holaaaaaaaaaaaa\"}')),
    ItemsStruct.fromSerializableMap(jsonDecode(
        '{\"titulo\":\"Hello World2\",\"contenido\":\"Hello World22222222222222222\"}')),
    ItemsStruct.fromSerializableMap(jsonDecode(
        '{\"titulo\":\"Hello World3\",\"contenido\":\"Hello World3333333333333333\"}'))
  ];
  List<ItemsStruct> get datosEjemplos => _datosEjemplos;
  set datosEjemplos(List<ItemsStruct> value) {
    _datosEjemplos = value;
    prefs.setStringList(
        'ff_datosEjemplos', value.map((x) => x.serialize()).toList());
  }

  void addToDatosEjemplos(ItemsStruct value) {
    datosEjemplos.add(value);
    prefs.setStringList(
        'ff_datosEjemplos', _datosEjemplos.map((x) => x.serialize()).toList());
  }

  void removeFromDatosEjemplos(ItemsStruct value) {
    datosEjemplos.remove(value);
    prefs.setStringList(
        'ff_datosEjemplos', _datosEjemplos.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDatosEjemplos(int index) {
    datosEjemplos.removeAt(index);
    prefs.setStringList(
        'ff_datosEjemplos', _datosEjemplos.map((x) => x.serialize()).toList());
  }

  void updateDatosEjemplosAtIndex(
    int index,
    ItemsStruct Function(ItemsStruct) updateFn,
  ) {
    datosEjemplos[index] = updateFn(_datosEjemplos[index]);
    prefs.setStringList(
        'ff_datosEjemplos', _datosEjemplos.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDatosEjemplos(int index, ItemsStruct value) {
    datosEjemplos.insert(index, value);
    prefs.setStringList(
        'ff_datosEjemplos', _datosEjemplos.map((x) => x.serialize()).toList());
  }

  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
  }

  Color _colorseleccionado = Colors.transparent;
  Color get colorseleccionado => _colorseleccionado;
  set colorseleccionado(Color value) {
    _colorseleccionado = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
