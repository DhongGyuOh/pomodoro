import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 10;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  void onTick(Timer timer) => {
        if (totalSeconds == 0)
          {
            setState(() {
              totalSeconds = 10;
              totalPomodoros++;
              isRunning = false;
            }),
            timer.cancel()
          }
        else
          setState(() {
            totalSeconds--;
          })
      };

  void onStartTimer() => {
        isRunning = true,
        timer = Timer.periodic(const Duration(seconds: 1), onTick)
      };

  void onPauseTimer() => {
        timer.cancel(),
        setState(() {
          isRunning = false;
        })
      };
  void onResetTimer() => {
        setState(() {
          isRunning = false;
          totalSeconds = 10;
          totalPomodoros = 0;
          timer.cancel();
        })
      };
  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    String str = duration.toString().split(".").first.substring(2, 7);
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  format(totalSeconds),
                  style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 89,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Flexible(
              flex: 2,
              child: Center(
                child: IconButton(
                  icon:
                      Icon(isRunning ? Icons.pause_circle : Icons.play_circle),
                  iconSize: 98,
                  color: Theme.of(context).cardColor,
                  onPressed: isRunning ? onPauseTimer : onStartTimer,
                ),
              )),
          Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Pomodors',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).focusColor),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                IconButton(
                                    onPressed: onResetTimer,
                                    icon: Icon(
                                      Icons.restore,
                                      size: 30,
                                      color: Colors.amber.shade900,
                                    ))
                              ],
                            ),
                            Text(
                              '$totalPomodoros',
                              style: const TextStyle(
                                  fontSize: 48, fontWeight: FontWeight.bold),
                            )
                          ]),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
