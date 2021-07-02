
import 'dart:async';
import 'package:path/path.dart';
import 'package:mobx/mobx.dart';
import 'package:sqflite/sqflite.dart';
part 'controller_geral.g.dart';

class ControllerGeral = _ControllerGeralBase with _$ControllerGeral;

abstract class _ControllerGeralBase with Store {



  //Definindo a Estrutura da Tabela_usuario
  String nomeTabela     = 'tbl_usuario';
  String colId          = 'id';
  String colNome        = 'nome';
  String colEmail       = 'email';
  String colSenha       = 'senha';
  String colData        = 'data_cadastro';

  //Definindo a Estrutura da Tabela_produto
  String nomeTabela_produto     = 'tbl_produto';
  String colId_produto          = 'id';
  String colNome_produto        = 'nome_produto'; //obrigatorio
  String colpreco               = 'preco';
  String colquantidade_estoque  = 'qtd_estoque';
  String colcodigo              = 'codigo'; // obrigatorio
  String colData_produto        = 'data_cadastro';




  @observable
  Database _database;






  //Método que ira verificar se o banco foi inicializado
  Future<Database> get database async{
    if (_database == null){
      _database = await getDatabase();
    }
  }



  //Método que cria o banco e executa a construção das tabelas
  Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'basedata.bd'),
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE $nomeTabela ('
            '$colId INTEGER PRIMARY KEY AUTOINCREMENT, '
            '$colNome Text,'
            '$colEmail Text,'
            '$colSenha Text,'
            '$colData Text)'
        );
        await db.execute('CREATE TABLE $nomeTabela_produto ('
            '$colId_produto INTEGER PRIMARY KEY AUTOINCREMENT, '
            '$colNome_produto Text,'
            '$colpreco Text,'
            '$colquantidade_estoque Text,'
            '$colcodigo Text,'
            '$colData_produto Text)'
        );
      },
      version: 1,
    );
  }




}