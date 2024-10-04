import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/foundation.dart';

class BatteryProvider with ChangeNotifier {
  final Battery _battery = Battery();
  int _batteryLevel = 100;
  BatteryState _batteryState = BatteryState.full;

  int get batteryLevel => _batteryLevel;
  BatteryState get batteryState => _batteryState;

  BatteryProvider() {
    _init();
  }

  Future<void> _init() async {
    _batteryLevel = await _battery.batteryLevel;
    _batteryState = await _battery.onBatteryStateChanged.first;

    // Update battery level and state when changed
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      _batteryState = state;
      notifyListeners();
    });
  }

  Future<void> refreshBatteryLevel() async {
    _batteryLevel = await _battery.batteryLevel;
    notifyListeners();
  }
}