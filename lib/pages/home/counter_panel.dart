import 'package:flutter/material.dart';

class CounterPanel extends StatelessWidget {
  const CounterPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              height: 35,
              width: 35,
            ),
          ),
        ],
      ),
    );
  }
}