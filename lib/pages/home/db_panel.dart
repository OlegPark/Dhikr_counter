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
          crossAxisAlignment: CrossAxisAlignment.start,
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
              margin: const EdgeInsets.only(top: 3, bottom: 15),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 200,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: alphaGreyLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text(
                          '$index',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: alphaBlue,
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 1,
                          color: Colors.white,
                        ),
                        const Expanded(
                          child: Text(
                            'Заголовок который показывается в Зикре в нашем приложении',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        const Text(
                          '19.02.2023',
                          style: TextStyle(
                            fontSize: 10,
                            color: alphaGrey,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("object");
                          },
                          child: const SizedBox(
                            height: 48,
                            child: Icon(Icons.do_not_step),
                          ),
                        ),
                      ],
                    ),
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