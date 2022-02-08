class Usuario {
  //será mudado para produtos
   int id = 0;
   String name         = '';
   String email        = '';
   String nascimento   = '';
   String sexo         = '';
   int    idade        =  0;
   String data_criacao = '';

  Usuario({required this.id, required this.name, required this.email, required this.nascimento, required this.sexo, required this.idade, required this.data_criacao });

  Map<String, dynamic>toMap(){
    return{
      'id': id,
      'nome': name,
      'email': email,
      'nascimento': nascimento,
      'sexo': sexo,
      'idade': idade,
      'data_cadastro': data_criacao
    };
  }

}