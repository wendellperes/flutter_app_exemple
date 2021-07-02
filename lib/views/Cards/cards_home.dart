import 'package:avaliacao_empresa_flutter/componentes/app_colors.dart';
import 'package:avaliacao_empresa_flutter/componentes/app_text_styles.dart';
import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  final List listPesoas;

  const Cards({Key key, this.listPesoas}) : super(key: key);
  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: widget.listPesoas.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  // Navigator.pushNamed(
                  //     context,
                  //     '/atualizar_produto',
                  //     arguments: lista_produtos[index]['id']
                  // );
                },
                child: Container(
                    height: 120,
                    margin: EdgeInsets.only(bottom: 10.0),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.purple,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('Nome: ', style: AppTextStyles.heading15,),
                                    Text('${widget.listPesoas[index]['nome']}', style: AppTextStyles.bodylightGrey,),
                                  ],
                                ),
                                //Button de Excluir o produto
                                Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColors.inicialRed,
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.clear),
                                      iconSize: 15,
                                      onPressed: () async {

                                      },
                                    )
                                ),

                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text('Email: ', style: AppTextStyles.heading15,),
                                Text('${widget.listPesoas[index]['email']}', style: AppTextStyles.bodylightGrey,),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text('Nascimento: ', style: AppTextStyles.heading15,),
                                Text('${widget.listPesoas[index]['nascimento']}', style: AppTextStyles.bodylightGrey,),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Idade: ', style: AppTextStyles.heading15,),
                                Text('${widget.listPesoas[index]['idade']}', style: AppTextStyles.bodylightGrey,),

                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text('Sexo: ', style: AppTextStyles.heading15,),
                                Text('${widget.listPesoas[index]['sexo']}', style: AppTextStyles.bodylightGrey,),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text('Data Cadastro: ', style: AppTextStyles.heading15,),
                                Text('${widget.listPesoas[index]['data']}' , style: AppTextStyles.bodylightGrey,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              );
            }
        )
    );
  }
}
