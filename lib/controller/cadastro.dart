import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/login.dart';
import 'package:flutter_application_1/model/ItemModel.dart';
import 'dart:async';
import 'package:path/path.dart';


class CadastroPage extends StatefulWidget {
  final String title;
  final String? image;

  const CadastroPage({super.key, required this.title, this.image});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
   final _formKey = GlobalKey<FormState>();

  
 TextEditingController _textEditingControllerNome = TextEditingController();
 TextEditingController _textEditingControllerSenha = TextEditingController();
 TextEditingController _textEditingControllerSenhaConfirme = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Text("Let's get started!",
          style: TextStyle(
            fontSize: 24,
          ),),
          Text('Signup to have your own bookmarks and personal preferences'),
          Padding(padding: const EdgeInsets.all(8.0),
          child: Form(  
            key: _formKey,
            child: Column(
              children: [ 
                Center(
                  child: Container( 
                    width: 150,
                    height: 130,
                ),
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Por favor, preencha todos os campos';
                    }
                    return null;
                  },
                  controller: _textEditingControllerNome,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Username',
                        ),
                ),
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                child: TextFormField( 
                  obscureText: true,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Por favor, preencha todos os campos';
                    }
                    return null;
                  },
                  controller: _textEditingControllerSenha,
                  decoration: InputDecoration(
                     border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                     hintText: 'Password'
                  ),
                ),
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                child: TextFormField( 
                  obscureText: true,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Por favor, preencha todos os campos';
                    }
                    return null;
                  },
                  controller: _textEditingControllerSenhaConfirme,
                  decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     hintText: 'Confirm Password'
                  ),
                ),
                ),
                ElevatedButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Processando dados')));
                  }
                }, 
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), 
                    minimumSize: MaterialStateProperty.all<Size>(Size(150, 50)), 
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                child: Text(
                  'SIGNUP',
                  style: TextStyle(color: Colors.white),
                  ),),
              ],
            ),
          ),
          ),
          Container(
           alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage(title: ''))
                  );
                },
                child: Text(
                  'Already logged? Login here',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          )
        ],),
      ),
    );
  }
}