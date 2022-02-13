import 'package:dartz/dartz.dart';

import '../entities/usuario_listar_entitie.dart';

abstract class IUsuarioRepository {
  Future<Either<Exception, bool>> register(UsuarioEntity usuarioEntity);
  Future<Either<Exception, List<UsuarioEntity>>> listAll();
  Future<Either<Exception, bool>> listById(String id);
}