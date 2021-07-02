import 'dart:io';
import 'dart:async';
import 'package:avaliacao_empresa_flutter/controllers/controller_busca/controller_busca.dart';
import 'package:avaliacao_empresa_flutter/controllers/controller_geral.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:avaliacao_empresa_flutter/models/usuario_model.dart';
import 'package:sqflite/sqflite.dart';
part 'controller_delete.g.dart';

class ControllerDelete = _ControllerDeleteBase with _$ControllerDelete;

abstract class _ControllerDeleteBase with Store {



}