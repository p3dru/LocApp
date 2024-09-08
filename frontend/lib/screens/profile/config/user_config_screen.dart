import 'package:flutter/material.dart';

class UserConfigScreen extends StatefulWidget {
  const UserConfigScreen({super.key});

  @override
  State<UserConfigScreen> createState() => _UserConfigScreenState();
  }

  class _UserConfigScreenState extends State<UserConfigScreen> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
                'Configurações',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  ),
              ),
            ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              ListTile(
                leading: Icon(Icons.notifications_off_outlined),
                title: Text('Notificações'),
                subtitle: Text('Ative as notificações e fique por dentro das novidades'),
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),

              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                    elevation: 0,
                    foregroundColor: Theme.of(context).colorScheme.secondary,
                    shape: const StadiumBorder(),
                    side: BorderSide.none,
                  ),
                  child: const Text('Limpar Cache (100mb)'),
                ),
              ),

              const SizedBox(height: 20,), 
              const Divider(thickness: 0.1, color: Colors.grey,),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text.rich(
                      TextSpan(
                        text: 'Versão',
                        style: TextStyle(fontSize: 12),
                        children: [
                          TextSpan(text: ' 1.0.0',  style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }