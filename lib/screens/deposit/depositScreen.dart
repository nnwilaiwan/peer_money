import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class DepositScreen extends StatefulWidget {
  static const String id = "AssetsScreen";
  final void Function() onInit;
  const DepositScreen({Key? key, required this.onInit}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text(''));
  }
}
