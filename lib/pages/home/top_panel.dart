import 'package:dhikr_counter/providers/tabs_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../constanst/constants.dart';

class TopPanel extends StatelessWidget {
  const TopPanel({super.key,});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TabsProvider>();

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
                      onTap: () => provider.isActive ? null : provider.toggle(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: provider.isActive ? alphaBlue : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          'Activity'.tr(),
                          style: TextStyle(
                            fontSize: 12,
                            color: provider.isActive ? Colors.white : alphaGrey,
                          ),
                        )
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => !provider.isActive ? null : provider.toggle(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: !provider.isActive ? alphaBlue : Colors.white,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          'Saved'.tr(),
                          style: TextStyle(
                            fontSize: 12,
                            color: !provider.isActive ? Colors.white : alphaGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => context.go('/settings'),
            child: Container(
              width: 54,
              height: 38,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              margin: const EdgeInsets.only(left: 20),
              child: Image.asset('assets/images/menu.png'),
            ),
          ),
        ],
      ),
    );
  }
}