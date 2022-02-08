import 'dart:ffi';

import 'package:avaliacao_empresa_flutter/componentes/app_border_styles.dart';
import 'package:avaliacao_empresa_flutter/componentes/app_colors.dart';
import 'package:avaliacao_empresa_flutter/componentes/app_text_styles.dart';
import 'package:avaliacao_empresa_flutter/componentes/button_custom/button_custom.dart';
import 'package:avaliacao_empresa_flutter/componentes/loading.dart';
import 'package:avaliacao_empresa_flutter/componentes/popup/popup.dart';
import 'package:avaliacao_empresa_flutter/controllers/controller_inserir/controller_inserir.dart';
import 'package:date_time_picker/date_time_picker.dart';
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
  final String _dataControler                    = DateTime.now().toString();
  bool isSalvando = false;
  String sexo = 'Masculino';
  late ControllerInserir controllerInserir;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NativeApi.initializeApiDLData.address.toString();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controllerInserir = Provider.of<ControllerInserir>(context, listen: false);
  }
  _onsuccess( bool response){
    if (response == true){
      print(response);
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text('Cadastrando...'),
        backgroundColor: Colors.green,
      ));
      Navigator.pushReplacementNamed(context, '/home');
    }else{
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text('Error ao tentar Cadastrar'),
        backgroundColor: Colors.red,
      ));
    }
  }
  void dropChange(String? val){
    sexo = val!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: Container(
          color: Colors.white,
          child: isSalvando != true ? Center(
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
                            maxLength: 70,
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
                              counterText: ''
                            ),
                            validator: (value){
                              if ( value!.isEmpty){
                                return 'Campo nao pode ser vazio';
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
                              if ( value!.isEmpty){
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
                          DateTimePicker(
                            type: DateTimePickerType.date,
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
                            dateMask: 'dd/MM/yyyy',
                            firstDate: DateTime(1500),
                            lastDate: DateTime(2100),
                            timeLabelText: "Horas",
                            locale: Locale("pt", "BR"),
                            onChanged: (val) async {
                              _dataNascimento.text = val;
                            },
                            validator: (value){
                              if ( value!.isEmpty){
                                return 'Campo nao pode ser vazio';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              labelText: 'Sexo',
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
                            value: sexo,
                            onChanged: dropChange,
                              items: <String>['Masculino', 'Feminino', 'Indiferente']
                                  .map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  child: Text(
                                    value,
                                  ),
                                  value: value,
                                );
                              }).toList(),

                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonCustom(
                          title: 'Cancelar',
                          color: AppColors.darkRed,
                          ontap: (){
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    Popup(
                                      title: 'Você realmente Deseja Fechar a Tela?',
                                      titleButton1: 'Sim',
                                      titleButton2: 'Não',
                                      FunctionButton1: (){
                                        Navigator.pushReplacementNamed(context, '/home');
                                      },
                                      FunctionButton2: (){
                                        Navigator.pop(context);
                                      },
                                    )
                            );
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ButtonCustom(
                          title: 'Adicionar',
                          color: AppColors.purple,
                          ontap: () async {
                            if(_formKey.currentState!.validate()){
                              setState(() {
                                isSalvando = true;
                              });
                              //
                              await controllerInserir.Cadastrar(
                                nome: _nome.text,
                                email: _emailControle.text,
                                data_nascimento: _dataNascimento.text,
                                sexo: sexo,
                                data: _dataControler,
                                onsuccess: _onsuccess
                              );

                            }
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
          ) : LoadingPage(title: 'Salvando...',)
        )

    );
  }
}