import 'package:avaliacao_empresa_flutter/features/usuarios/data/datasource/usuario_datasource.dart';
import 'package:avaliacao_empresa_flutter/features/usuarios/domain/entities/usuario_listar_entitie.dart';
import 'package:avaliacao_empresa_flutter/features/usuarios/domain/repositories/usuario_repository.dart';
import 'package:dartz/dartz.dart';

class FaqExtraRepositoryImpl implements IUsuarioRepository {
  final IUsuarioNetworkDataSource _usuarioDataSource;
  FaqExtraRepositoryImpl(this._usuarioDataSource,);

  @override
  Future<Either<Exception, List<UsuarioEntity>>> listAll() {
    // TODO: implement listAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, bool>> listById(String id) {
    // TODO: implement listById
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, bool>> register(UsuarioEntity usuarioEntity) {
    // TODO: implement register
    throw UnimplementedError();
  }

 
}