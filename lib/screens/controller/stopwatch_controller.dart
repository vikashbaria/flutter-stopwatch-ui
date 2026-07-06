import 'dart:async';
import 'package:get/get.dart';

class StopWatchController extends GetxController {
  Timer? _timer;

  final RxInt _totalSeconds = 0.obs;
  final RxBool _isRunning = false.obs;

  bool get isRunning => _isRunning.value;

  int get hours => _totalSeconds.value ~/ 3600;
  int get minutes => (_totalSeconds.value % 3600) ~/ 60;
  int get seconds => _totalSeconds.value % 60;

  void start() {
    if (_isRunning.value) return;

    _isRunning.value = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _totalSeconds.value++;
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    _isRunning.value = false;
  }

  void reset() {
    stop();
    _totalSeconds.value = 0;
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
