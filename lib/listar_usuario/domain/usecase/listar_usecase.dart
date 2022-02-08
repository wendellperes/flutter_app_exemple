import 'package:avaliacao_empresa_flutter/listar_usuario/domain/entities/usuario_entities.dart';
import 'package:avaliacao_empresa_flutter/listar_usuario/domain/repositories/listar_repository.dart';
import 'package:avaliacao_empresa_flutter/core/usecases/no_params.dart';
import 'package:avaliacao_empresa_flutter/core/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

class ListarUseCase implements IUseCase<UsuarioEntity, NoParams> {
  const ListarUseCase(this.repository);

  final IListarRepository repository;

  @override
  Future<Either<Exception, UsuarioEntity>> call(NoParams params) async {
    return repository.list();
  }
}
