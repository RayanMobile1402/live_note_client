import 'package:flutter/material.dart';
import 'package:flutter_nice_ui/flutter_nice_ui.dart';

import '../../../shared/widgets/custom_appbar.dart';
import '../../../shared/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => const NiceScaffold(
        drawer: CustomDrawer(),
        startWidget: CustomDrawer(),
        appBar: CustomAppbar(title: 'Home Page'),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NiceText('Client'),
              ],
            ),
          ],
        ),
      );
}
