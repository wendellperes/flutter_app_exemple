
import 'package:avaliacao_empresa_flutter/core/usecases/no_params.dart';
import 'package:avaliacao_empresa_flutter/features/listar_usuario/domain/entities/usuario_entities.dart';
import 'package:avaliacao_empresa_flutter/features/listar_usuario/domain/repositories/listar_repository.dart';
import 'package:avaliacao_empresa_flutter/features/listar_usuario/domain/usecase/listar_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFaqRepository extends Mock implements IListarRepository {}

class FakeFaqExtraEntity extends Fake implements UsuarioEntity {}

void main() {
  late MockFaqRepository repository;
  late ListarUseCase faqPixListUsecase;
  final List<UsuarioEntity> listEntity = [
    UsuarioEntity(
      name: 'Wendell Caco1',
      email: 'email@hotmmail.com',
      dataNascimento: '10/02/7878',
      sexo: 'M',
      ),
      UsuarioEntity(
      name: 'Wendell Caco2',
      email: 'email@hotmmail.com',
      dataNascimento: '10/02/7878',
      sexo: 'M',
      ),
      UsuarioEntity(
      name: 'Wendell Caco3',
      email: 'email@hotmmail.com',
      dataNascimento: '10/02/7878',
      sexo: 'M',
      )
  ];

  setUpAll(() {
    repository = MockFaqRepository();
    faqPixListUsecase = ListarUseCase(repository);
    registerFallbackValue(FakeFaqExtraEntity());
  });

  void setWhenSuccess(List<UsuarioEntity> usuarioEntity) {
    when(() => repository.list())
        .thenAnswer((_) async => Right(listEntity));
  }

  group('Listar Usuarios : ', () {
    test('Deve retornar um objeto do tipo UsuarioEntity como sucesso',
        () async {
      setWhenSuccess(listEntity);

      final result = await faqPixListUsecase(NoParams());

      result.fold((l) => null, (r){

          expect(r, listEntity);
      });
      
    });

    // test('Deve retornar uma ServerFailure caso a aconteça um erro', () async {
    //   when(() => repository.listTopic('')).thenAnswer((_) async =>
    //       Left(ServerFailure(error: ErrorResponsePixEnum.timeout)));

    //   final result = await faqPixListUsecase('');

    //   result.fold(
    //       onLeft: (l) {
    //         expect(l, isA<IFailure>());
    //       },
    //       onRight: (r) => r);
    //   verify(() => repository.listTopic('')).called(1);
    // });
  });
}
