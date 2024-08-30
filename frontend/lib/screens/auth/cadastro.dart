import 'package:flutter/material.dart';
import 'package:frontend/screens/auth/login.dart';
import 'package:getwidget/getwidget.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  final String? image;

  const CadastroPage({super.key, required this.title, this.image});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();

  final _nomeCtrl = TextEditingController();
  final _senhaCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return CadastroDesktop(_nomeCtrl, _senhaCtrl, _emailCtrl);
          } else {
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Bem-vindo!',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Crie sua conta gratuita e comece a aproveitar os benefícios!',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 35),
                          _NomeField(_nomeCtrl),
                          const SizedBox(height: 20),
                          _EmailField(_emailCtrl),
                          const SizedBox(height: 20),
                          _SenhaField(_senhaCtrl),
                          const SizedBox(height: 25),
                          _CadastroButton(),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(title: ''),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Já tem conta? Entre aqui',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _nomeCtrl.dispose();
    _senhaCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }
}

class CadastroDesktop extends StatelessWidget {
  final TextEditingController _nomeCtrl;
  final TextEditingController _senhaCtrl;
  final TextEditingController _emailCtrl;

  CadastroDesktop(this._nomeCtrl, this._senhaCtrl, this._emailCtrl);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Image.asset(
            'assets/images/work.png',
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 21),
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Bem-vindo!',
                  style: TextStyle                  (
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Crie sua conta gratuita e comece a aproveitar os benefícios!',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 35),
                _NomeField(_nomeCtrl),
                const SizedBox(height: 20),
                _EmailField(_emailCtrl),
                const SizedBox(height: 20),
                _SenhaField(_senhaCtrl),
                const SizedBox(height: 25),
                _CadastroButton(),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(title: ''),
                          ),
                        );
                      },
                      child: Text(
                        'Já tem conta? Entre aqui',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _NomeField extends StatelessWidget {
  final TextEditingController _controller;

  _NomeField(this._controller);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha todos os campos';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
        hintText: 'Nome',
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  final TextEditingController _controller;

  _EmailField(this._controller);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha todos os campos';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
        hintText: 'Email',
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
    );
  }
}

class _SenhaField extends StatelessWidget {
  final TextEditingController _controller;

  _SenhaField(this._controller);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha todos os campos';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock),
        hintText: 'Senha',
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
    );
  }
}


class _CadastroButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: () {},
      text: "Entrar",
      color: Colors.blue,
      size: GFSize.LARGE,
      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      hoverColor: Colors.blueAccent, // Cor de hover azul claro
    );
  }
}