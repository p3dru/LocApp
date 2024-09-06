import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/bottom.navigation.dart';

class UserEditInfo extends StatelessWidget {
  const UserEditInfo({
    Key? key
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nomeCtr = TextEditingController();
    final emailCtr = TextEditingController();
    final phoneCtr = TextEditingController();
    final senhaCtr = TextEditingController();
    final formKey = GlobalKey<FormState>();


    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              'Editar Perfil',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child:  const Image(image: NetworkImage("https://th.bing.com/th/id/OIP.6vwZcc33X4K1oOH5puuU_gHaF7?w=225&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),),
                    ),
                  ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: nomeCtr,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(133, 147, 146, 155)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 218, 220, 223)),
                    ),
                    label: Text('nome'), 
                    prefixIcon: Icon(Icons.person_outline_rounded),
                    ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: emailCtr,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Color.fromARGB(133, 147, 146, 155)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 218, 220, 223)),
                    ),
                    label: Text('email'), 
                    prefixIcon: Icon(Icons.mail),
                  )
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: phoneCtr,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(133, 147, 146, 155)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 218, 220, 223)),
                    ),
                    label: Text('telefone'), 
                    prefixIcon: Icon(Icons.phone)),
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: senhaCtr,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(133, 147, 146, 155)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 218, 220, 223)),
                    ),
                    label: Text('senha'), 
                    prefixIcon: Icon(Icons.password)),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.tertiary,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      child: const Text('Salvar', style: TextStyle(color: Colors.black),)
                      ),
                  ),
                ),
              ),

              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text.rich(
                      TextSpan(
                        text: 'Joined',
                        style: TextStyle(fontSize: 12),
                        children: [
                          TextSpan(text: ' 00 jan 2024', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.withOpacity(0.1),
                        elevation: 0,
                        foregroundColor: Colors.red,
                        shape: const StadiumBorder(),
                        side: BorderSide.none,
                        ),
                      child: const Text('Deletar'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      )
    );
    
  }
}