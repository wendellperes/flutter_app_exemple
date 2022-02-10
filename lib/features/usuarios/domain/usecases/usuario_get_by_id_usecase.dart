import 'package:avaliacao_empresa_flutter/core/usecases/no_params.dart';
import 'package:avaliacao_empresa_flutter/core/usecases/usecases.dart';
import 'package:avaliacao_empresa_flutter/features/usuarios/domain/repositories/usuario_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserByIdUseCase implements IUseCase<bool, String> {
  const GetUserByIdUseCase(this.repository);

  final IUsuarioRepository repository;

  @override
  Future<Either<Exception, bool>> call(String id) async {
    return repository.listById(id);
  }
}
