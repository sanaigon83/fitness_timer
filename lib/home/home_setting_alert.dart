import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class HomeSettingAlert extends StatefulWidget {
  final int runningTime;
  final int refreshTime;
  final int setCount;

  const HomeSettingAlert({
    super.key,
    required this.runningTime,
    required this.refreshTime,
    required this.setCount,
  });

  @override
  State<HomeSettingAlert> createState() => _HomeSettingAlertState();
}

class _HomeSettingAlertState extends State<HomeSettingAlert> {
  int _runningTime = 0;
  int _refreshTime = 0;
  int _setCount = 0;

  @override
  void initState() {
    super.initState();
    _runningTime = widget.runningTime;
    _refreshTime = widget.refreshTime;
    _setCount = widget.setCount;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "운동시간",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700),
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberPicker(
                    value: _runningTime,
                    minValue: 1,
                    maxValue: 60,
                    onChanged: (value) {
                      setState(() {
                        _runningTime = value;
                      });
                    },
                  ),
                  Text("초"),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "휴식시간",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700),
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberPicker(
                    value: _refreshTime,
                    minValue: 1,
                    maxValue: 60,
                    onChanged: (value) {
                      setState(() {
                        _refreshTime = value;
                      });
                    },
                  ),
                  Text("초"),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "세트 수",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700),
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberPicker(
                    value: _setCount,
                    minValue: 1,
                    maxValue: 10,
                    onChanged: (value) {
                      setState(() {
                        _setCount = value;
                      });
                    },
                  ),
                  Text("회"),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(
              context,
              {
                "runningTime": _runningTime,
                "refreshTime": _refreshTime,
                "setCount": _setCount,
              },
            );
          },
          child:
              Text("확인", style: TextStyle(color: Colors.black, fontSize: 20)),
        ),
      ],
    );
  }
}
