import 'package:dhikr_counter/constanst/constants.dart';
import 'package:flutter/material.dart';

class CounterPanel extends StatelessWidget {
  const CounterPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24),
          margin: const EdgeInsets.only(bottom: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: alphaBlueLight,
                  ),
                  height: 35,
                  width: 35,
                  child: Image.asset('assets/images/decrement.png'),
                ),
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: alphaBlue,
                  ),
                  height: 154,
                  width: 154,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 15),
                      Text(
                        '33',
                        style: TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                      Text(
                        'Dhikr',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 1),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: alphaBlueLight,
                  ),
                  height: 35,
                  width: 35,
                  child: Image.asset('assets/images/zeroing.png'),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            height: 45,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 14),
            child: const Text(
              'Save Dhikr',
              style: TextStyle(
                color: alphaBlue
              ),
            ),
          ),
        ),
      ],
    );
  }
}