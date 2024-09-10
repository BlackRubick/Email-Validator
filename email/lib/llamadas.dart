import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Llamadas extends StatelessWidget {
  final List<Map<String, String>> usuarios = [
    {
      'nombre': 'Cesar Gomez Aguilera 213507',
      'numero': '9611519667', // Ejemplo de número válido
    },
    {
      'nombre': 'Jose Angel Naparen Ordoñes 213367',
      'numero': '9613682291', // Asegúrate de que todos los números sean válidos
    },
    {
      'nombre': 'Alma Abril Nuñez Gonzalez 213368',
      'numero': '9612996390',
    },
  ];

  // Función para realizar la llamada
  void _realizarLlamada(String numero) async {
    final Uri url = Uri(scheme: 'tel', path: numero);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('No se puede realizar la llamada al número: $numero');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Llamadas'),
        backgroundColor: Colors.teal[800],
      ),
      body: ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          final usuario = usuarios[index];
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.teal),
              title: Text(
                usuario['nombre']!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Número: ${usuario['numero']}',
                style: TextStyle(fontSize: 16),
              ),
              trailing: Icon(Icons.call, color: Colors.green),
              onTap: () {
                final numero = usuario['numero'];
                if (numero != null && numero.isNotEmpty) {
                  _realizarLlamada(numero);
                } else {
                  print('Número no válido para ${usuario['nombre']}');
                }
              },
            ),
          );
        },
      ),
    );
  }
}
