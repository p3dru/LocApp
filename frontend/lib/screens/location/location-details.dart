import 'package:flutter/material.dart';
import 'package:frontend/widgets/bottom.navigation.dart';

class LocationDetails extends StatefulWidget {
  const LocationDetails({super.key});

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  // Simulação de dados vindos do banco de dados
  final List<String> images = [
    "https://picsum.photos/200/300/?blur",
    "https://picsum.photos/200",
    "https://picsum.photos/800"
  ];

  final Map<String, String> openingHours = {
    'Dom': '--',
    'Seg': '08h - 18h',
    'Ter': '08h - 18h',
    'Qua': '08h - 18h',
    'Qui': '08h - 18h',
    'Sex': '08h - 18h',
    'Sab': '--',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nome do Local'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Adicione o código do onPressed aqui!
        },
        label: const Text('Reservar'),
        icon: const Icon(Icons.calendar_month),
      ),
      body: ListView(
        children: [
          // Carrossel de imagens
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: PageView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.network(
                  images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),

          // Título do local
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Text(
              'Locação 01',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),

          // Descrição do local
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
          ),

          // Tabela de horários
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Table(
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey.shade500),
                  children: openingHours.keys.map((day) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Center(
                        child: Text(
                          day,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  children: openingHours.values.map((hours) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Center(
                        child: Text(hours),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          // Preço do local
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Text(
              'R\$18 p/ Horário',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.white,
                backgroundColor: Color.fromARGB(255, 0, 102, 255),
              ),
            ),
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
