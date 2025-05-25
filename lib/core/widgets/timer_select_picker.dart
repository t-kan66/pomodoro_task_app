// 時間を選択するためのPicker
// このPickerは、時間を選択するためのPickerです。
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerSelectPicker extends StatelessWidget {
  final int initialMinutes;
  final Function(int) onMinutesChanged;
  final String title;
  final int startMinutes; // 追加：開始時間（分）
  final int endMinutes; // 追加：終了時間（分）

  const TimerSelectPicker({
    super.key,
    required this.initialMinutes,
    required this.onMinutesChanged,
    this.title = '分を選択',
    this.startMinutes = 1, // デフォルト値：1分
    this.endMinutes = 60, // デフォルト値：60分
  })  : assert(startMinutes <= endMinutes), // 開始時間が終了時間以下であることを確認
        assert(initialMinutes >= startMinutes && initialMinutes <= endMinutes);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // ... existing code ...
          Expanded(
            child: CupertinoPicker(
              itemExtent: 32,
              scrollController: FixedExtentScrollController(
                initialItem: initialMinutes - startMinutes, // 開始時間を考慮して初期位置を調整
              ),
              onSelectedItemChanged: (int index) {
                onMinutesChanged(index + startMinutes); // 開始時間を考慮して値を調整
              },
              children: List<Widget>.generate(
                endMinutes - startMinutes + 1, // 開始時間から終了時間までの項目数
                (int index) {
                  return Center(
                    child: Text(
                      '${index + startMinutes}分',
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountSelectPicker extends StatelessWidget {
  final int initialCount;
  final Function(int) onCountChanged;
  final String title;
  final int startCount; // 開始回数
  final int endCount; // 終了回数

  const CountSelectPicker({
    super.key,
    required this.initialCount,
    required this.onCountChanged,
    this.title = '回数を選択',
    this.startCount = 1, // デフォルト値：1回
    this.endCount = 4, // デフォルト値：4回
  })  : assert(startCount <= endCount), // 開始回数が終了回数以下であることを確認
        assert(initialCount >= startCount && initialCount <= endCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(
                initialItem: initialCount - startCount,
              ),
              itemExtent: 40,
              onSelectedItemChanged: (int index) {
                onCountChanged(index + startCount);
              },
              children: List<Widget>.generate(
                endCount - startCount + 1, // 開始回数から終了回数までの項目数
                (int index) {
                  return Center(
                    child: Text(
                      '${index + startCount}回',
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
