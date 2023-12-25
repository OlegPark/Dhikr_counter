import 'package:dhikr_counter/constanst/constants.dart';
import 'package:flutter/material.dart';

class DBPanel extends StatelessWidget {
  const DBPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            const Text(
              'Last saved dhikrs',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              width: 60,
              height: 2,
              color: alphaBlue,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2000,
                itemBuilder: (context, index) {
                  return Container(
                    height: 48,
                    decoration: BoxDecoration(color: alphaGreyLight),
                    child: Text('$index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}