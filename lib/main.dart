import 'package:flutter/material.dart';
import 'package:negocios_col_panel/widgets/grafico_sercular.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: GraficoCircular(
            data: [
              ItemGraficoCircular(label: "Descargas", value: 25),
              ItemGraficoCircular(label: "Negocios", value: 15),
            ],
          ),
        ),
      ),
    );
  }
}
