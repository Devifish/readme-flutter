import 'dart:ffi';

import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final void Function() sureFunction;
  final void Function() cancelFunction;
  String _confirmContent;

  ConfirmDialog(this._confirmContent, this.sureFunction, this.cancelFunction);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(_confirmContent),
      actions: <Widget>[
        TextButton(onPressed: sureFunction, child: Text('确定')),
        TextButton(onPressed: cancelFunction, child: Text('取消')),
      ],
    );
  }
}
