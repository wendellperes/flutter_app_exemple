import 'package:equatable/equatable.dart';
class UsuarioEntity extends Equatable {
  const UsuarioEntity({
    required this.name,
    required this.email,
    required this.dataNascimento,
    required this.sexo
  });

  factory UsuarioEntity.empty() => const UsuarioEntity(
        email: '',
        name: '',
        dataNascimento: '',
        sexo: ''
      );
  final String name;
  final String email;
  final String dataNascimento;
  final String sexo;

  @override
  List<Object?> get props => [
        name,
        email,
        dataNascimento,
        sexo
      ];
}
