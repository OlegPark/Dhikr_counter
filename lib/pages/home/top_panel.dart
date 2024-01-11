import 'package:flutter/material.dart';

import '../../constanst/constants.dart';

class TopPanel extends StatefulWidget {
  const TopPanel({super.key,});

  @override
  State<TopPanel> createState() => _TopPanelState();
}

class _TopPanelState extends State<TopPanel> {
  bool isActive = true;

  void toggle() {
    setState(() {
      isActive = !isActive;
    });
  }

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
                    child: GestureDetector(
                      onTap: () => toggle(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isActive ? alphaBlue : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          'Activity',
                          style: TextStyle(
                            fontSize: 12,
                            color: isActive ? Colors.white : alphaGrey,
                          ),
                        )
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => toggle(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: !isActive ? alphaBlue : Colors.white,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          'Saved',
                          style: TextStyle(
                            fontSize: 12,
                            color: !isActive ? Colors.white : alphaGrey,
                          ),
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
            child: Image.asset('assets/images/menu.png'),
          ),
        ],
      ),
    );
  }
}