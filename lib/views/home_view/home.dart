
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_empresa_flutter/componentes/app_colors.dart';
import 'package:avaliacao_empresa_flutter/componentes/drawer/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.purple,
        title: Text('HOME - Pessoas'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.purple,
        onPressed: (){
          print('Cadastrar Pessoas');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
