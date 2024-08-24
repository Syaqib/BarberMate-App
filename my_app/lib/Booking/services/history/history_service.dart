import 'package:my_app/Booking/models/history.dart';

class HistoryService {
  List<Map<String, dynamic>> histories;

  HistoryService({required this.histories});

  Future<void> addHistory(Map<String, dynamic> history) async {
    histories.add(history);
  }

  Future<List<History>> getCompletedHistories() async {
    return histories
        .where((historyData) => historyData['isDone'] == true)
        .map((historyData) => History.fromMap(historyData))
        .toList();
  }
}
