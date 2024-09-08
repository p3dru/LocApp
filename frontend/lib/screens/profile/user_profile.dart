import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/auth/welcome_screen.dart';
import 'package:frontend/screens/profile/config/user_config_screen.dart';
import 'package:frontend/screens/profile/edit_info/user_edit_info.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ListTile(
                leading: const Image(image: NetworkImage("https://th.bing.com/th/id/OIP.6vwZcc33X4K1oOH5puuU_gHaF7?w=225&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",), width: 50, height: 50,),
                title: Text('Usuário 01', style: TextStyle(color: Colors.black),),
                subtitle: Text('usuario@gmail.com', style: TextStyle(color: Colors.black),),
                trailing: IconButton(
                  onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const UserEditInfo()));
                    },
                  icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.secondary,),
                  ),
              ),

              const SizedBox(height: 30,),
              const Divider(thickness: 0.1, color: Colors.grey,),
              const SizedBox(height: 10,),


              ProfileMenu(
                title: "Configuração", 
                subtitle: "Notificações e cache",
                icon: CupertinoIcons.gear, 
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserConfigScreen()));

              },),
              ProfileMenu(
                title: "Detalhes das Locações", 
                subtitle: "Em progresso ou finalizadas",
                icon: CupertinoIcons.calendar, 
                onPressed: (){},),

              ProfileMenu(
                title: "Conta", 
                subtitle: "Conta e segurança",
                icon: CupertinoIcons.person_alt_circle, 
                onPressed: (){},),

              const Divider(height: 10, thickness: 0.1, color: Colors.grey, ),
              ProfileMenu(
                title: "Informação",
                subtitle: "Termos e Privacidade", 
                icon: CupertinoIcons.info, 
                onPressed: (){}),

              ProfileMenu(
                title: "Sair", 
                subtitle: "",
                icon: Icons.logout, 
                textColor: Colors.red,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
                }
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPressed,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,

      leading: Container(
        width: 40, 
        height: 40,
        child: Icon(icon),
      ),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium?.apply(color: textColor),),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium?.apply(color: textColor)),
      trailing: endIcon? Container(
              width: 30, 
              height: 30,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.transparent
              ),
              child: const Icon(Icons.arrow_forward_ios, color: Colors.black87, size: 16,),
            ) : null, 
    );
   
  }
}

