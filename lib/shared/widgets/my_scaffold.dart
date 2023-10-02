import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;
  final bool hasElevation;
  final bool showClickToCareIcon;
  final List<Widget>? action;
  final Widget? drawer;
  final bool automaticallyImplyLeading;
  final Color? background;

  const MyScaffold({
    required this.title,
    required this.body,
    super.key,
    this.hasElevation = true,
    this.floatingActionButton,
    this.showClickToCareIcon = true,
    this.action,
    this.drawer,
    this.automaticallyImplyLeading = true,
    this.background,
  });

  @override
  State<MyScaffold> createState() => MyScaffoldState();
}

class MyScaffoldState extends State<MyScaffold> {
  GlobalKey<ScaffoldState>? _scaffoldKey;

  @override
  void initState() {
    if (widget.key != null) {
      _scaffoldKey = GlobalKey<ScaffoldState>();
    }

    super.initState();
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        key: _scaffoldKey,
        floatingActionButton: widget.floatingActionButton,
        backgroundColor:
            widget.background ?? Theme.of(context).colorScheme.background,
        drawer: widget.drawer,
        resizeToAvoidBottomInset: false,
        drawerDragStartBehavior: DragStartBehavior.down,
        appBar: AppBar(
          elevation: widget.hasElevation ? 3 : 0,
          centerTitle: true,
          title: Text(widget.title),
          actions: widget.action,
          automaticallyImplyLeading: widget.automaticallyImplyLeading,
          // leading: Container(),
        ),
        body: SafeArea(child: widget.body),
      );

  void openDrawer() {
    _scaffoldKey?.currentState?.openDrawer();
  }
}
