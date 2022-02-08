

import 'package:avaliacao_empresa_flutter/listar_usuario/domain/entities/usuario_entities.dart';
import 'package:avaliacao_empresa_flutter/core/usecases/no_params.dart';
import 'package:dartz/dartz.dart';

abstract class IListarRepository {
  Future<Either<Exception, UsuarioEntity>> list();
  Future<Either<Exception, bool>> create(UsuarioEntity usuarioEntity);
}