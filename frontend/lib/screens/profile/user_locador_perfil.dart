import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/auth/welcome_screen.dart';
import 'package:frontend/screens/profile/edit_info/user_locador_edit_profile.dart';
import 'package:frontend/screens/profile/user_profile.dart';

class UserLocadorPerfil extends StatefulWidget {
  const UserLocadorPerfil({super.key});

  @override
  State<UserLocadorPerfil> createState() => _UserLocadorPerfilState();
}

class _UserLocadorPerfilState extends State<UserLocadorPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child:  const Image(image: NetworkImage("https://th.bing.com/th/id/OIP.6vwZcc33X4K1oOH5puuU_gHaF7?w=225&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),),
                ),
              ),

              const SizedBox(height: 10,),
              Text('Locador 01', style: TextStyle(color: Colors.black),),
              Text('locador@gmail.com', style: TextStyle(color: Colors.black),),
              
              const SizedBox(height: 20,),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserLocadorEditProfile()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  child: const Text('Editar perfil', style: TextStyle(color: Colors.black),),
                ),
              ),
              const SizedBox(height: 30,),
              const Divider(thickness: 0.1, color: Colors.grey,),
              const SizedBox(height: 10,),

              ProfileMenu(title: 'Configuração', icon: CupertinoIcons.gear, onPressed: (){},),
              ProfileMenu(title: 'Registro de Locatários', icon: CupertinoIcons.calendar, onPressed: (){}),
              ProfileMenu(title: 'Conta', icon: CupertinoIcons.person_alt_circle, onPressed: (){}),
              const Divider(height: 10, thickness: 0.1, color: Colors.grey,),
              ProfileMenu(title: 'Informação', icon: CupertinoIcons.info, onPressed: (){}),
              ProfileMenu(
                title: "Sair", 
                icon: Icons.logout, 
                textColor: Colors.red,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
                },
                ),
            ],
          ),
        ),
      ),
    );
  }
}