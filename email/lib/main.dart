import 'package:flutter/material.dart';
import 'llamadas.dart'; // Asegúrate de importar la vista de llamadas

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'validador de correos',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EmailChecker(),
    );
  }
}

class EmailChecker extends StatefulWidget {
  @override
  _EmailCheckerState createState() => _EmailCheckerState();
}

class _EmailCheckerState extends State<EmailChecker> {
  final TextEditingController _controller = TextEditingController();
  String _statusMessage = "";
  Color? _btnColor = Colors.grey[400];
  String _inputEmail = "";

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        final email = _controller.text;
        if (email.isEmpty) {
          _btnColor = Colors.grey[400];
        } else if (email.endsWith('@hotmail.com')) {
          _btnColor = Colors.green;
          _statusMessage = "¡Correo válido!";
        } else {
          _btnColor = Colors.red;
          _statusMessage = "Correo inválido debe de terminar en '@hotmail.com'";
        }
      });
    });
  }

  void _checkEmail() {
    final email = _controller.text;
    setState(() {
      if (email.endsWith('@hotmail.com')) {
        _statusMessage = "¡Correo válido!";
        _inputEmail = email;
      } else {
        _statusMessage = "Correo inválido. Debe terminar en '@hotmail.com'.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('validador de correos'),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.teal[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            Text(
              'Introduce tu email:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.teal[800],
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.teal[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(Icons.email, color: Colors.teal[600]),
                filled: true,
                fillColor: Colors.teal[50],
              ),
              style: TextStyle(
                color: Colors.teal[900],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _btnColor == Colors.grey[400] ? null : _checkEmail,
              style: ElevatedButton.styleFrom(
                backgroundColor: _btnColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: _btnColor != Colors.grey[400] ? 8 : 0,
                shadowColor: Colors.black54,
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: Text('Verificar Email'),
            ),
            SizedBox(height: 20),
            Text(
              'Email ingresado es: $_inputEmail',
              style: TextStyle(
                fontSize: 18,
                color: Colors.teal[800],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Text(
              _statusMessage,
              style: TextStyle(
                fontSize: 18,
                color: _statusMessage.startsWith('¡') ? Colors.green : Colors.red,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.black45,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Llamadas()),
                );
              },
              child: Text('Contactos'),
            ),
          ],
        ),
      ),
    );
  }
}
