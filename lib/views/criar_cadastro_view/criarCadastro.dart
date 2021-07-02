import 'package:avaliacao_empresa_flutter/componentes/app_border_styles.dart';
import 'package:avaliacao_empresa_flutter/componentes/app_colors.dart';
import 'package:avaliacao_empresa_flutter/componentes/app_text_styles.dart';
import 'package:avaliacao_empresa_flutter/componentes/button_custom/button_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey                          = GlobalKey<ScaffoldState>();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _emailControle = TextEditingController();
  final TextEditingController _dataNascimento = TextEditingController();

  bool _securityPassword = true;
  bool isCheckLogin;

  //ControllerBusca controllerBusca;


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //controllerBusca = Provider.of<ControllerBusca>(context, listen: false);
  }
  _loginSucess( bool response){
    if (response == true){
      print(response);
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Entrando...'),
        backgroundColor: Colors.green,
      ));
      Navigator.pushReplacementNamed(context, '/home');
    }else{
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Email ou Senha Inválidos...'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          color: Colors.white,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      'images/logo-teste2.jpg',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Cadastrar novo Usuario',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26.0, top:15.0, right: 26.0, bottom: 0.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _nome,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Nome*',
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                              ),
                              disabledBorder: disabledBorder,
                              enabledBorder: enabledBorder,
                              focusedBorder: focusedBorder,
                              border:  border,
                            ),
                            validator: (value){
                              if ( value.isEmpty){
                                return 'Campo nao pode ser vazio';
                              } else if(!value.contains('@')){
                                return 'e-mail Inválido!';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _emailControle,
                            keyboardType: TextInputType.emailAddress,

                            decoration: InputDecoration(
                              labelText: 'Email*',
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                              ),
                              disabledBorder: disabledBorder,
                              enabledBorder: enabledBorder,
                              focusedBorder: focusedBorder,
                              border:  border,
                            ),
                            validator: (value){
                              if ( value.isEmpty){
                                return 'Campo nao pode ser vazio';
                              } else if(!value.contains('@')){
                                return 'e-mail Inválido!';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _dataNascimento,
                            keyboardType: TextInputType.number,

                            decoration: InputDecoration(
                              labelText: 'Data Nascimento*',
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                              ),
                              disabledBorder: disabledBorder,
                              enabledBorder: enabledBorder,
                              focusedBorder: focusedBorder,
                              border:  border,
                            ),
                            validator: (value){
                              if ( value.isEmpty){
                                return 'Campo nao pode ser vazio';
                              } else if(!value.contains('@')){
                                return 'e-mail Inválido!';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _emailControle,
                            keyboardType: TextInputType.number,

                            decoration: InputDecoration(
                              labelText: 'Sexo em dropdonw*',
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.black38,
                                fontWeight: FontWeight.w400,
                              ),
                              disabledBorder: disabledBorder,
                              enabledBorder: enabledBorder,
                              focusedBorder: focusedBorder,
                              border:  border,
                            ),
                            validator: (value){
                              if ( value.isEmpty){
                                return 'Campo nao pode ser vazio';
                              } else if(!value.contains('@')){
                                return 'e-mail Inválido!';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonCustom(
                          title: 'Adicionar',
                          ontap: (){
                            print('cadastrar');
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ButtonCustom(
                          title: 'Cancelar',
                          ontap: (){
                            print('cancelar');
                          },
                        ),

                      ],
                    ),
                  ),
                  //montagem do butão com padding para ajustar seu tamanho

                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        )

    );
  }
}