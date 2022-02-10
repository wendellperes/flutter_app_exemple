import 'package:avaliacao_empresa_flutter/core/usecases/no_params.dart';
import 'package:avaliacao_empresa_flutter/core/usecases/usecases.dart';
import 'package:avaliacao_empresa_flutter/features/usuarios/domain/entities/usuario_listar_entitie.dart';
import 'package:avaliacao_empresa_flutter/features/usuarios/domain/repositories/usuario_repository.dart';
import 'package:dartz/dartz.dart';

class ListAllUseCase implements IUseCase<List<UsuarioEntity>, NoParams> {
  const ListAllUseCase(this.repository);

  final IUsuarioRepository repository;

  @override
  Future<Either<Exception, List<UsuarioEntity>>> call(NoParams params) async {
    return repository.listAll();
  }
}