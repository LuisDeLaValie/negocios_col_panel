import 'package:flutter/material.dart';
import 'package:negocios_col_panel/widgets/grafico_sercular.dart';
import 'package:negocios_col_panel/widgets/graficos_barras.dart';

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
          child: GraficosBarras(
            data: [
              ItemGraficosBarras(label: "L", value: 25, name: 'Lunes'),
              ItemGraficosBarras(label: "M", value: 25, name: 'Lunes'),
              ItemGraficosBarras(label: "M", value: 25, name: 'Lunes'),
              ItemGraficosBarras(label: "J", value: 25, name: 'Lunes'),
              ItemGraficosBarras(label: "V", value: 25, name: 'Lunes'),
              
            ],
          ),
        ),
      ),
    );
  }
}
