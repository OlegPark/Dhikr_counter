import 'package:flutter/material.dart';

import '../../constanst/constants.dart';

class TopPanel extends StatelessWidget {
  const TopPanel({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(4),
              height: 38,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: alphaBlue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 30,
                      alignment: Alignment.center,
                      child: const Text(
                        'Activity',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      height: 30,
                      alignment: Alignment.center,
                      child: const Text(
                        'Saved',
                        style: TextStyle(
                          fontSize: 12,
                          color: alphaGrey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 54,
            height: 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            margin: const EdgeInsets.only(left: 20),
            child: const Icon(
              Icons.menu,
              color: alphaBlue,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}