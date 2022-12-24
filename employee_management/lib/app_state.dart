import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _AccessToken = prefs.getString('ff_AccessToken') ?? _AccessToken;
    _DetailsUpdated = prefs.getBool('ff_DetailsUpdated') ?? _DetailsUpdated;
    _Role = prefs.getString('ff_Role') ?? _Role;
    _Name = prefs.getString('ff_Name') ?? _Name;
  }

  late SharedPreferences prefs;

  String _AccessToken = '';
  String get AccessToken => _AccessToken;
  set AccessToken(String _value) {
    notifyListeners();

    _AccessToken = _value;
    prefs.setString('ff_AccessToken', _value);
  }

  bool _DetailsUpdated = false;
  bool get DetailsUpdated => _DetailsUpdated;
  set DetailsUpdated(bool _value) {
    notifyListeners();

    _DetailsUpdated = _value;
    prefs.setBool('ff_DetailsUpdated', _value);
  }

  String _Role = '';
  String get Role => _Role;
  set Role(String _value) {
    notifyListeners();

    _Role = _value;
    prefs.setString('ff_Role', _value);
  }

  String _Name = '';
  String get Name => _Name;
  set Name(String _value) {
    notifyListeners();

    _Name = _value;
    prefs.setString('ff_Name', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
