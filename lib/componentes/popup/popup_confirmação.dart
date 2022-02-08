import 'package:flutter/material.dart';

import '../app_colors.dart';

class PopupCorfirmacao extends StatelessWidget {
  final String title;
  final VoidCallback FunctionButton1;
  final VoidCallback FunctionButton2;
  final String titleButton1;
  final String titleButton2;

  const PopupCorfirmacao(
      {required this.title,
      required this.FunctionButton1,
      required this.FunctionButton2,
      required this.titleButton1,
      required this.titleButton2})
    ;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 60),
      actions: [
        FlatButton(
            onPressed: FunctionButton2,
            color: AppColors.purple,
            child: Text(titleButton2)),
        FlatButton(
            onPressed: FunctionButton1,
            color: AppColors.darkRed,
            child: Text(titleButton1))
      ],
    );
  }
}
