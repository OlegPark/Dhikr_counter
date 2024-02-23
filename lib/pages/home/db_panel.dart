import 'package:dhikr_counter/constanst/constants.dart';
import 'package:dhikr_counter/models/dhikr.dart';
import 'package:dhikr_counter/providers/hive_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
            Text(
              'Last saved dhikrs'.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              width: 60,
              height: 2,
              color: alphaBlue,
              margin: const EdgeInsets.only(top: 3, bottom: 15),
            ),
            const Expanded(child: HiveDhikrView(),),
          ],
        ),
      ),
    );
  }
}

class HiveDhikrView extends StatelessWidget {
  const HiveDhikrView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<HiveProvider>().openDhikrBox(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ValueListenableBuilder(
            valueListenable: Hive.box<Dhikr>(keyHiveDhikrBox).listenable(),
            builder: (context, box, child) {
              final boxLenght = box.length;

              if (box.length ==0) {
                return Center(child: Text('Empty'.tr()),);
              }
              
              return ListView.builder(
              itemCount: boxLenght,
              itemBuilder: (context, index) {
                index = box.length - 1 - index; // инвертация LisrView
                return DhikrItem(box, index);
                },
              );
            }, 
          );
        } else {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        
      }, 
    );
  }
}

class DhikrItem extends StatelessWidget {
  final Box<Dhikr> box;
  final int index;

  const DhikrItem(this.box, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
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
              box.getAt(index)?.counter.toString() ?? '0',
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
          Expanded(
            child: Text(
              box.getAt(index)?.title ?? 'error title'.tr(),
              style: const TextStyle(
                fontSize: 12,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 15,),
          Text(
            DateFormat('dd.MM.yyyy').format(box.getAt(index)?.date ?? DateTime.now()),
            style: const TextStyle(
              fontSize: 10,
              color: alphaGrey,
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return EditDhikrView(box: box, index: index);
                },
              );
            },
            child: Container(
              color: Colors.transparent,
              height: 48,
              width: 48,
              child: Image.asset('assets/images/dots.png'),
            ),
          ),
        ],
      ),
    );
  }
}

class EditDhikrView extends StatefulWidget {
  const EditDhikrView({
    super.key,
    required this.box,
    required this.index,
  });

  final Box<Dhikr> box;
  final int index;

  @override
  State<EditDhikrView> createState() => _EditDhikrViewState();
}

class _EditDhikrViewState extends State<EditDhikrView> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Dhikr'.tr()),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoTextField(
            controller: controller,
            placeholder: widget.box.getAt(widget.index)?.title,
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: () {
          context.read<HiveProvider>().deleteDhikr(widget.index);

          context.pop();
          },
          icon: const Icon(Icons.delete),
        ),
        TextButton(
          onPressed: () => context.pop(),
          child: Text('Cancel'.tr()),
        ),
        FilledButton(
          onPressed: () {
            context.read<HiveProvider>().editDhikr(widget.index, controller.text);

            context.pop();
          },
          child: Text('Save'.tr()),
        ),
      ],
    );
  }
}
