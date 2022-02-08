
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
  String colNascimento  = 'nascimento';
  String colSexo        = 'sexo';
  String colIdade       = 'idade';
  String colData        = 'data_cadastro';

  @observable
  late Database _database;

  //Método que ira verificar se o banco foi inicializado
  Future<Database> update() async {
    try {
      if(_database == null ){
        return _database = getDatabase() as Database;
      }else{
        return _database;
      }
    }  catch (e) {
      print(e.toString());
      throw Exception;
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
            '$colNascimento Text,'
            '$colSexo Text,'
            '$colIdade Text,'
            '$colData Text)'
        );

      },
      version: 1,
    );
  }




}