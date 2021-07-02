
import 'package:avaliacao_empresa_flutter/views/Cards/cards_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_empresa_flutter/componentes/app_colors.dart';
import 'package:avaliacao_empresa_flutter/componentes/app_text_styles.dart';
import 'package:avaliacao_empresa_flutter/componentes/drawer/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<Home> {

  List<Map> lista_pessoas = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var Pessoa1 = {
      "id": "1",
      "nome": "1",
      "email": "1",
      "nascimento": "1",
      "idade": "1",
      "sexo": "1",
      "data": "1",
    };
    var Pessoa2 = {
      "id": "2",
      "nome": "1",
      "email": "1",
      "nascimento": "1",
      "idade": "1",
      "sexo": "1",
      "data": "1",
    };
    var Pessoa3 = {
      "id": "3",
      "nome": "1",
      "email": "1",
      "nascimento": "1",
      "idade": "1",
      "sexo": "1",
      "data": "1",
    };

    lista_pessoas.add(Pessoa1);
    lista_pessoas.add(Pessoa2);
    lista_pessoas.add(Pessoa3);
  }
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
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Cards(listPesoas: lista_pessoas,)

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.purple,
        onPressed: (){
          Navigator.pushNamed(context, '/Cadastrar');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
