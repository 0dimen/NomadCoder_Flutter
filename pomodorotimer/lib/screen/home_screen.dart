import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pomodorotimer/widget/time_select.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectTime = 25;
  int totalSeconds = 25 * 60;
  int round = 0;
  int goal = 0;
  bool isRunning = false;
  bool isRefresingTime = false;

  late List<String> formatedTime = ['25', '00'];
  late Timer timer;
  void onTick(Timer timer) {
    setState(() {
      totalSeconds--;
      if (totalSeconds == 0) {
        if (isRefresingTime) {
          isRefresingTime = false;
          totalSeconds = selectTime * 60;
        } else {
          isRefresingTime = true;
          totalSeconds = 5 * 60;
          round++;
          if (round == 4) {
            round = 0;
            goal++;
          }
        }
        timerCancle();
      }
    });

    format(totalSeconds);
  }

  void onStartPressed() {
    timer = Timer.periodic(
        const Duration(seconds: 1) // every seconds
        ,
        onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    setState(() {
      isRunning = false;
    });
    timerCancle();
  }

  void format(int seconds) {
    var duration = Duration(seconds: seconds);
    formatedTime =
        duration.toString().split('.').first.substring(2, 7).split(':');
  }

  void onTimePressed(int selectedTime) {
    setState(() {
      selectTime = selectedTime;
      totalSeconds = selectTime * 60;
    });
    format(totalSeconds);
    timerCancle();
  }

  void timerCancle() {
    timer.cancel();
    isRunning = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Flexible(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'POMOTIMER',
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                        ),
                        child: Text(
                          formatedTime[0],
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 50,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                            color: Theme.of(context).cardColor.withOpacity(0.6),
                            fontSize: 50,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                        height: 100,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                        ),
                        child: Text(
                          formatedTime[1],
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 50,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ]),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () => onTimePressed(15),
                          child: TimeSelectButton(
                            time: 15,
                            selectedTime: selectTime,
                          )),
                      TextButton(
                          onPressed: () => onTimePressed(20),
                          child: TimeSelectButton(
                            time: 20,
                            selectedTime: selectTime,
                          )),
                      TextButton(
                          onPressed: () => onTimePressed(25),
                          child: TimeSelectButton(
                            time: 25,
                            selectedTime: selectTime,
                          )),
                      TextButton(
                          onPressed: () => onTimePressed(30),
                          child: TimeSelectButton(
                            time: 30,
                            selectedTime: selectTime,
                          )),
                      TextButton(
                          onPressed: () => onTimePressed(35),
                          child: TimeSelectButton(
                            time: 35,
                            selectedTime: selectTime,
                          )),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: IconButton(
                    iconSize: 80,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: isRunning
                        ? const Icon(Icons.pause_circle_outline)
                        : const Icon(Icons.play_circle_outline),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '$round/4',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Theme.of(context)
                                          .cardColor
                                          .withOpacity(0.6),
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'ROUND',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context).cardColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '$goal/12',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Theme.of(context)
                                          .cardColor
                                          .withOpacity(0.6),
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  'GOAL',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context).cardColor,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
