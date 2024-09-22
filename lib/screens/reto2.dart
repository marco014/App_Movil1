import 'package:flutter/material.dart';

class Reto2Screen extends StatefulWidget {
  const Reto2Screen({Key? key}) : super(key: key);

  @override
  _Reto2ScreenState createState() => _Reto2ScreenState();
}

class _Reto2ScreenState extends State<Reto2Screen> {
  // Controlador para el campo de texto
  final TextEditingController _controller = TextEditingController();
  
  // Mensaje para mostrar el estado de la validación
  String _statusMessage = "";
  
  // Color del botón
  Color? _btnColor = Colors.grey[400];
  
  // Correo electrónico ingresado
  String _inputEmail = "";

  @override
  void initState() {
    super.initState();
    
    // Agregar un listener al controlador del campo de texto
    _controller.addListener(() {
      setState(() {
        final email = _controller.text;
        
        // Cambiar el color del botón y el mensaje basado en el contenido del campo de texto
        if (email.isEmpty) {
          _btnColor = Colors.grey[400];
        } else if (email.endsWith('@gmail.com')) {
          _btnColor = const Color.fromARGB(255, 83, 255, 155);
          _statusMessage = "¡Correo válido!";
        } else {
          _btnColor = Colors.red;
          _statusMessage = "Correo inválido. Debe terminar en '@gmail.com'.";
        }
      });
    });
  }

  // Método para validar el correo electrónico
  void _checkEmail() {
    final email = _controller.text;
    setState(() {
      if (email.endsWith('@gmail.com')) {
        _statusMessage = "¡Correo válido!";
        _inputEmail = email; // Guardar el correo electrónico ingresado
      } else {
        _statusMessage = "Correo inválido. Debe terminar en '@gmail.com'.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reto 2 - Validador de Email'),
        backgroundColor: const Color.fromARGB(255, 33, 82, 243),
        elevation: 10,
        shape: const RoundedRectangleBorder(
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
            const SizedBox(height: 50), // Espacio vertical
            Text(
              'Introduce tu email:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.teal[800],
              ),
            ),
            const SizedBox(height: 20), // Espacio vertical
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
            const SizedBox(height: 20), // Espacio vertical
            ElevatedButton(
              // Cambiar la acción del botón basado en el color
              onPressed: _btnColor == Colors.grey[400] ? null : _checkEmail,
              style: ElevatedButton.styleFrom(
                backgroundColor: _btnColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: _btnColor != Colors.grey[400] ? 8 : 0,
                shadowColor: Colors.black54,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: const Text('Verificar Email'),
            ),
            const SizedBox(height: 20), // Espacio vertical
            // Mostrar el correo electrónico ingresado
            Text(
              'Email ingresado es: $_inputEmail',
              style: TextStyle(
                fontSize: 18,
                color: Colors.teal[800],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20), // Espacio vertical
            // Mostrar el mensaje de validación
            Text(
              _statusMessage,
              style: TextStyle(
                fontSize: 18,
                color: _statusMessage.startsWith('¡') ? Colors.green : Colors.red,
                fontWeight: FontWeight.w600,
                shadows: const [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.black45,
                    offset: Offset(2.0, 2.0),
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
