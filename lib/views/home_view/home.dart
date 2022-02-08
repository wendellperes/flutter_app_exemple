
import 'package:avaliacao_empresa_flutter/componentes/loading.dart';
import 'package:avaliacao_empresa_flutter/componentes/popup/popup.dart';
import 'package:avaliacao_empresa_flutter/controllers/controller_busca/controller_busca.dart';
import 'package:avaliacao_empresa_flutter/views/Cards/cards_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_empresa_flutter/componentes/app_colors.dart';
import 'package:avaliacao_empresa_flutter/componentes/app_text_styles.dart';
import 'package:avaliacao_empresa_flutter/componentes/drawer/drawer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<Home> {
  ControllerBusca controllerBusca = ControllerBusca();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
     controllerBusca = Provider.of<ControllerBusca>(context, listen: false);
     controllerBusca.buscarDadosGerais();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.purple,
        title: Text('Joao Desenvolvedor'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body:  Observer(
        builder: (_){
          return
            controllerBusca.lista_pessoas != null ?
                controllerBusca.lista_pessoas!.length == 0 ?
                Container(
                  child: Center(child: Text('Nenhum Cadastro encontrado...'),),
                ):
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Cards(
                listPesoas: controllerBusca.lista_pessoas!,
              )
            ],
          ) : LoadingPage(title: 'Carregando',);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.purple,
        onPressed: (){
          Navigator.pushReplacementNamed(context, '/Cadastrar');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
