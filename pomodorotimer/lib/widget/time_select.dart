import 'package:flutter/material.dart';

class TimeSelectButton extends StatelessWidget {
  final int time;
  final int selectedTime;
  const TimeSelectButton(
      {super.key, required this.time, required this.selectedTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: (time == selectedTime)
              ? Theme.of(context).cardColor
              : Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: Theme.of(context).cardColor,
          )),
      child: Text(
        '$time',
        style: TextStyle(
          color: (time == selectedTime)
              ? Theme.of(context).colorScheme.background
              : Theme.of(context).cardColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
