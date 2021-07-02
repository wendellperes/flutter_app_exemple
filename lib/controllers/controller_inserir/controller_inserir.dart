
import 'dart:async';
import 'package:avaliacao_empresa_flutter/controllers/controller_geral.dart';
import 'package:avaliacao_empresa_flutter/models/usuario_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:sqflite/sqflite.dart';
part 'controller_inserir.g.dart';

class ControllerInserir = _ControllerInserirBase with _$ControllerInserir;

abstract class _ControllerInserirBase with Store {
  ControllerGeral controllerGeral;
@observable
 int idCadastro;

@action
  Future<void>Cadastrar({
  @required String nome,
  @required String email,
  @required String nascimento,
  @required String sexo,
  @required String idade,
  @required String data,}
  ) async {
   var dados =  Usuario(
     name: nome,
     email: email,
     nascimento: nascimento,
     sexo: sexo,
     idade: idade,
     data_criacao: data
   );

   try {
     final Database db = await controllerGeral.getDatabase();

     idCadastro  = await db.insert(
       'tbl_usuario',
       dados.toMap(),
     );
     print(idCadastro);
   } catch (ex) {
     print(ex);
     return;
   }



  }



}