import 'package:dhikr_counter/constanst/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterPanel extends StatefulWidget {
  const CounterPanel({super.key});

  @override
  State<CounterPanel> createState() => _CounterPanelState();
}

class _CounterPanelState extends State<CounterPanel> {
  int counter = 0;

  Future<void> increment() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      counter++;
    });

    prefs.setInt('counter', counter);
  }

  Future<void> getCounter() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      counter = prefs.getInt('counter') ?? 0;
    });
  }

  @override
  void initState() {
    getCounter();

    super.initState();
  }

  void decrement() {
    if (counter > 0) {
      setState(() {
        counter --;
      });
    }
  }

  void zeroing() {
    if (counter != 0) {
      setState(() {
        counter = 0;
      });
    }
  }

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
                onTap: () => decrement(),
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
                onTap: () => increment(),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: alphaBlue,
                  ),
                  height: 154,
                  width: 154,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 25),
                      Text(
                        counter.toString(),
                        style: const TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                      const Text(
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
                onTap: () => zeroing(),
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