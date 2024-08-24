import 'package:flutter/material.dart';
import 'package:my_app/Booking/services/history/history_service.dart';

class HistoryViewModel extends ChangeNotifier {
  final HistoryService historyService;

  HistoryViewModel({required this.historyService});

  List<Map<String, dynamic>> get histories => historyService.histories;

  void addHistory(Map<String, dynamic> history) {
    historyService.addHistory(history);
    notifyListeners();
  }
}
