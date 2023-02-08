import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  void playSound(String note) async {
    final player = AudioPlayer();
    await player.play(AssetSource(note));
  }

  Expanded buildKey({required int noteNumber, required Color color}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          playSound('note$noteNumber.wav');
        },
        child: null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Title(),
                  buildKey(noteNumber: 1, color: Colors.amber),
                  buildKey(noteNumber: 2, color: Colors.red),
                  buildKey(noteNumber: 3, color: Colors.blue),
                  buildKey(noteNumber: 4, color: Colors.teal),
                  buildKey(noteNumber: 5, color: Colors.orange),
                  buildKey(noteNumber: 6, color: Colors.purple),
                  buildKey(noteNumber: 7, color: Colors.green),
                ]),
          ),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Play Sound",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.amber,
        ),
      ),
    );
  }
}
