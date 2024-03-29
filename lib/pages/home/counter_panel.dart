import 'package:dhikr_counter/constanst/constants.dart';
import 'package:dhikr_counter/models/dhikr.dart';
import 'package:dhikr_counter/providers/counter_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CounterPanel extends StatelessWidget {
  const CounterPanel({super.key});

  
  @override
  Widget build(BuildContext context) {
    final counterProvider = context.read<CounterProvider>();

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
                onTap: () => counterProvider.decrement(),
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
                onTap: () => counterProvider.increment(),
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
                      const Counter(),
                      Text(
                        'Dhikr'.tr(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 1),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => counterProvider.zeroing(),
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
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                


                return const AddDhikr();
              }
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            height: 45,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 14),
            child: Text(
              'Save Dhikr'.tr(),
              style: const TextStyle(
                color: alphaBlue
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AddDhikr extends StatefulWidget {
  const AddDhikr({super.key});


  @override
  State<AddDhikr> createState() => _AddDhikrState();
}

class _AddDhikrState extends State<AddDhikr> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providrCounter = context.read<CounterProvider>();
    return AlertDialog(
      title: Text('Add Dhikr'.tr()),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${'Counter:'.tr()} ${providrCounter.counter}'),
          Text('${'Date:'.tr()} ${DateFormat('dd.MM.yyyy').format(DateTime.now())}'),
          const SizedBox(height: 10),
          CupertinoTextField(
            controller: controller,
            placeholder: 'Enter title'.tr(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text('Cancel'.tr()),
        ),
        FilledButton(
          onPressed: () {
            Hive.box<Dhikr>(keyHiveDhikrBox).add(
              Dhikr(
                counter: providrCounter.counter,
                title: controller.text,
                date: DateTime.now(),
              ),
            );

            context.pop();
          },
          child: Text('Add'.tr()),
        ),
      ],
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();

    return Text(
      counterProvider.counter.toString(),
      style: const TextStyle(
        fontSize: 48,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        height: 1,
      ),
    );
  }
}