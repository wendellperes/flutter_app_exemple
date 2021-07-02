import 'package:avaliacao_empresa_flutter/componentes/app_colors.dart';
import 'package:avaliacao_empresa_flutter/componentes/app_text_styles.dart';
import 'package:flutter/material.dart';
class ButtonCustom extends StatefulWidget {
  final Function ontap;
  final String title;

  const ButtonCustom({Key key, this.ontap, this.title}) : super(key: key);
  @override
  _ButtonCustomState createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
        ),
        color: widget.title == 'Adicionar' ? AppColors.purple : AppColors.darkRed,
        onPressed: widget.ontap,
        child: Text(widget.title, style: AppTextStyles.title,),
      ),
    );
  }
}
