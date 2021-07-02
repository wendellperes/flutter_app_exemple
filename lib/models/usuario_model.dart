class Usuario {
  //será mudado para produtos
   int id = 0;
   String name = '';
   String email = '';
   String senha = '';
   String data_criacao = '';

  Usuario({this.id, this.name, this.email, this.senha, this.data_criacao });

  Map<String, dynamic>toJson(){
    return{
      'id': id,
      'nome': name,
      'email': email,
      'senha': senha,
      'data_cadastro': data_criacao
    };
  }

}