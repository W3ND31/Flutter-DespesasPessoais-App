import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptableScaffold extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget body;
  final Widget fab;
  final FloatingActionButtonLocation fabLocation;
  final ObstructingPreferredSizeWidget navigationBar;

  const AdaptableScaffold({
    required this.appBar,
    required this.body,
    required this.fab,
    required this.fabLocation,
    required this.navigationBar,
    super.key,
    required,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: navigationBar,
            child: body,
          )
        : Scaffold(
            appBar: appBar,
            body: body,
            floatingActionButton: fab,
            floatingActionButtonLocation: fabLocation,
          );
  }
}
