import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_nice_ui/flutter_nice_ui.dart';

import '../../core/utils/utils.dart';

class CustomAppbar extends StatelessWidget implements PreferredSize {
  final String title;
  final bool automaticallyImplyLeading;

  const CustomAppbar(
      {required this.title, this.automaticallyImplyLeading = true, super.key});

  @override
  Widget build(BuildContext context) => _appbar(context);

  AppBar _appbar(BuildContext context) => AppBar(
        title: _title(context),
        foregroundColor: Utils.getBaseTheme(context).textColor,
        actions: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.network(
                    'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
                  ),
                ),
              ),
            ),
          ),
        ],
        automaticallyImplyLeading: automaticallyImplyLeading,
        leading: !automaticallyImplyLeading
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: badges.Badge(
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: Utils.getBaseTheme(context).warningColor,
                    ),
                    badgeContent: Text(
                      '3',
                      style:
                          TextStyle(color: Utils.getBaseTheme(context).white),
                    ),
                    child: Icon(
                      Icons.notifications_none,
                      size: 30,
                      color: Utils.getBaseTheme(context).secondaryColor,
                    ),
                  ),
                ),
              )
            : null,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
      );

  NiceText _title(BuildContext context) => NiceText(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
      );

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
