import 'package:flutter/widgets.dart';
import 'package:preuba_hewlett_packard/src/widget/Loading.dart';

class DataApp with ChangeNotifier {
  dynamic _dataApp;
  get dataApp => _dataApp;
  set setdataApp(dynamic dataApp) {
    this._dataApp = dataApp;
    notifyListeners();
  }

  bool _statusload = false;
  get statusload => _statusload;
  set setstatusload(dynamic statusload) {
    this._statusload = statusload;
    notifyListeners();
  }

  dynamic _dataApfv = [];
  get dataAppfv => _dataApfv;
  set setdataAppfv(dynamic dataAppfv) {
    this._dataApfv = dataAppfv;
    notifyListeners();
  }
}
