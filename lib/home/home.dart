import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

import 'home_setting_alert.dart';
import 'home_setting_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final countdownController = CountDownController();

  int _runningTime = 40;
  int _refreshTime = 20;
  int _setCount = 5;
  int _neonDuration = 0;

  final homeTextStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey.shade700);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: [
          //NeonCircualTimer
          NeonCircularTimer(
              onStart: _onStartNeonCircurlaTimer,
              onComplete: _onCompleteNeonCircurlaTimer,
              width: 200,
              controller: countdownController,
              duration: _neonDuration,
              strokeWidth: 20,
              isTimerTextShown: true,
              neumorphicEffect: true,
              outerStrokeColor: Colors.grey.shade100,
              innerFillGradient: LinearGradient(colors: [
                Colors.greenAccent.shade200,
                Colors.blueAccent.shade400
              ]),
              neonGradient: LinearGradient(colors: [
                Colors.greenAccent.shade200,
                Colors.blueAccent.shade400
              ]),
              strokeCap: StrokeCap.round,
              innerFillColor: Colors.black12,
              backgroudColor: Colors.grey.shade100,
              neonColor: Colors.blue.shade900),

          Divider(height: 50),

          Container(
            height: 200,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                HomeSettingText(
                  homeTextStyle: homeTextStyle,
                  title: "운동시간:",
                  value: "$_runningTime 초",
                ),
                SizedBox(height: 10),
                HomeSettingText(
                  homeTextStyle: homeTextStyle,
                  title: "휴식시간:",
                  value: "$_refreshTime 초",
                ),
                SizedBox(height: 10),
                HomeSettingText(
                  homeTextStyle: homeTextStyle,
                  title: "세트수:",
                  value: "$_setCount 회",
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: _onPressSetRunningTime,
                            child: Text("운동시간 설정"))),
                  ],
                )
              ],
            ),
          ),

          SizedBox(height: 30),
          // 운동시작 버튼
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: _onPressRunningStart,
                    child: Icon(
                      Icons.play_arrow,
                      size: 40,
                    )),
              ),
              SizedBox(width: 35),
              Expanded(
                child: ElevatedButton(
                    onPressed: _onPressRunningPause,
                    child: Icon(
                      Icons.pause,
                      size: 40,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onStartNeonCircurlaTimer() {}

  void _onCompleteNeonCircurlaTimer() {
    countdownController.restart();
  }

  // 운동시간 설정 버튼 클릭
  Future<void> _onPressSetRunningTime() async {
    var setTimeResult = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return HomeSettingAlert(
          refreshTime: _refreshTime,
          runningTime: _runningTime,
          setCount: _setCount,
        );
      },
    );

    setState(() {
      _runningTime = setTimeResult["runningTime"];
      _refreshTime = setTimeResult["refreshTime"];
      _setCount = setTimeResult["setCount"];
    });
  }

  // 운동 시작 버튼
  void _onPressRunningStart() {
    //TODO: 운동시작을 알리는 별도의 페이지 추가
    countdownController.restart(duration: _runningTime);
  }

  // 운동 중지 버튼
  void _onPressRunningPause() {}
}
