

import 'package:avaliacao_empresa_flutter/features/listar_usuario/domain/entities/usuario_entities.dart';
import 'package:avaliacao_empresa_flutter/core/usecases/no_params.dart';
import 'package:dartz/dartz.dart';

abstract class IListarRepository {
  Future<Either<Exception, List<UsuarioEntity>>> list();
}
