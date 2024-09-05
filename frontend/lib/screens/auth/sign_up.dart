import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/auth/components/my_text_field.dart';
import 'package:frontend/screens/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final senhaController = TextEditingController();
  final emailController = TextEditingController();
  final nomeController = TextEditingController();
  bool _isLocadorSelected = false;
  String _userType = 'Locador';
  final _formKey = GlobalKey<FormState>();
  IconData iconSenha = CupertinoIcons.eye_fill;
  bool obscureSenha = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: CustomTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(CupertinoIcons.mail_solid),
            ),
          ),
           const SizedBox(height: 10,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: CustomTextField(
                controller: nomeController,
                hintText: 'Nome',
                obscureText: false,
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(CupertinoIcons.person),
              ),
            ),
          const SizedBox(height: 10,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: CustomTextField(
              controller: senhaController,
              hintText: 'Senha',
              obscureText: obscureSenha,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(CupertinoIcons.lock_fill),

               suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureSenha = !obscureSenha;
                    if(obscureSenha){
                      iconSenha = CupertinoIcons.eye_fill;
                    } else {
                      iconSenha = CupertinoIcons.eye_slash_fill;
                    }
                  });
                },
                icon: Icon(iconSenha),
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 100,
                  children: [
                    Radio(
                      value: false,
                      groupValue: _isLocadorSelected,
                      onChanged: (value) {
                        setState(() {
                          _isLocadorSelected = value!;
                        });
                      },
                    ),
                    Text('Sou Locatário'),
                    Radio(
                      value: true,
                      groupValue: _isLocadorSelected,
                      onChanged: (value) {
                        setState(() {
                          _isLocadorSelected = value!;
                        });
                      },
                    ),
                    Text('Sou Locador'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: TextButton(
              onPressed:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  );
              },
              style: TextButton.styleFrom(
                elevation: 3.0,
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Text(
                  'Entrar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ),
              ),
          )
        ],
      )
      );
  }
}