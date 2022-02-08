import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:avaliacao_empresa_flutter/componentes/app_colors.dart';
import 'package:avaliacao_empresa_flutter/componentes/app_text_styles.dart';
class LoadingPage extends StatefulWidget {
  final String title;

  const LoadingPage({required this.title});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: Text(widget.title, style: AppTextStyles.heading,)
              ),
              SpinKitCircle(
                color: AppColors.purple,
                size: 40.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
