import 'package:flutter/material.dart';

import '../app_colors.dart';
class Popup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Você realmente Deseja Fechar a Tela?', textAlign: TextAlign.center,),
      actionsPadding: EdgeInsets.symmetric(horizontal: 60),
      actions: [
        FlatButton(
            onPressed: (){
              Navigator.pop(context);
            },
            color: AppColors.purple,
            child: Text('Não')
        ),
        FlatButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/home');
            },
            color: AppColors.darkRed,
            child: Text('Sim')
        )
      ],
    );
  }
}
