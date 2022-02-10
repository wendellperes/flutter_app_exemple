import 'package:avaliacao_empresa_flutter/features/usuarios/domain/entities/usuario_listar_entitie.dart';
import 'package:dartz/dartz.dart';

abstract class IUsuarioRepository {
  Future<Either<Exception, bool>> register(UsuarioEntity usuarioEntity);
  Future<Either<Exception, List<UsuarioEntity>>> listAll();
  Future<Either<Exception, bool>> listById(String id);
}