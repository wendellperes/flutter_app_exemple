import 'package:avaliacao_empresa_flutter/core/usecases/usecases.dart';
import 'package:avaliacao_empresa_flutter/features/usuarios/domain/entities/usuario_listar_entitie.dart';
import 'package:avaliacao_empresa_flutter/features/usuarios/domain/repositories/usuario_repository.dart';
import 'package:dartz/dartz.dart';

class CadastrarUseCase implements IUseCase<bool, UsuarioEntity> {
  const CadastrarUseCase(this.repository);

  final IUsuarioRepository repository;

  @override
  Future<Either<Exception, bool>> call(UsuarioEntity params) async {
    return repository.register(params);
  }
}
