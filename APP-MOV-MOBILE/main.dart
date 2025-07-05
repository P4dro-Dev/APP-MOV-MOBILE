import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movimentação de Imagem',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageMovementScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ImageMovementScreen extends StatefulWidget {
  const ImageMovementScreen({super.key});

  @override
  State<ImageMovementScreen> createState() => _ImageMovementScreenState();
}

class _ImageMovementScreenState extends State<ImageMovementScreen> {
  // Posição inicial da imagem
  double _top = 150.0;
  double _left = 150.0;
  
  // Tamanho da imagem
  final double _imageSize = 100.0;
  
  // Valor do incremento/decremento de posição
  final double _step = 20.0;

  // Métodos para mover a imagem
  void _moveUp() {
    setState(() {
      _top -= _step;
    });
  }

  void _moveDown() {
    setState(() {
      _top += _step;
    });
  }

  void _moveLeft() {
    setState(() {
      _left -= _step;
    });
  }

  void _moveRight() {
    setState(() {
      _left += _step;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controle de Imagem'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Título
          const Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Mova a Imagem com os Botões',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          // Imagem posicionada dinamicamente
          Positioned(
            top: _top,
            left: _left,
            child: Image.asset(
              'assets/image.png',
              width: _imageSize,
              height: _imageSize,
              fit: BoxFit.cover,
            ),
          ),
          
          // Controles de movimento
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Botão para cima
                ElevatedButton(
                  onPressed: _moveUp,
                  child: const Icon(Icons.arrow_upward),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [s
                    // Botão para esquerda
                    ElevatedButton(
                      onPressed: _moveLeft,
                      child: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 20),
                    // Botão para direita
                    ElevatedButton(
                      onPressed: _moveRight,
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
                // Botão para baixo
                ElevatedButton(
                  onPressed: _moveDown,
                  child: const Icon(Icons.arrow_downward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}