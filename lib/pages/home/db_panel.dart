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
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          child: Text(
                            index == 0 ? '234' : '$index',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: alphaBlue,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 1,
                          margin: const EdgeInsets.only(right: 10, left: 5),
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
                        const SizedBox(width: 15,),
                        const Text(
                          '19.02.2023',
                          style: TextStyle(
                            fontSize: 10,
                            color: alphaGrey,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            color: Colors.transparent,
                            height: 48,
                            width: 48,
                            child: const Icon(Icons.do_not_step),
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