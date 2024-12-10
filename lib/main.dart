import 'package:flutter/material.dart';
import 'package:negocios_col_panel/widgets/grafico_sercular.dart';
import 'package:negocios_col_panel/widgets/graficos_barras.dart';
import 'package:negocios_col_panel/widgets/graficos_doble_barras.dart';

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
          child: GraficosDobleBarras(
            data: [
              ItemGraficosDobleBarras(
                  label: "L",
                  value1: 25,
                  value2: 20,
                  name1: 'Productos',
                  name2: 'Servicios'),
              ItemGraficosDobleBarras(
                  label: "M",
                  value1: 30,
                  value2: 45,
                  name1: 'Productos',
                  name2: 'Servicios'),
              ItemGraficosDobleBarras(
                  label: "M",
                  value1: 25,
                  value2: 15,
                  name1: 'Productos',
                  name2: 'Servicios'),
              ItemGraficosDobleBarras(
                  label: "J",
                  value1: 45,
                  value2: 15,
                  name1: 'Productos',
                  name2: 'Servicios'),
              ItemGraficosDobleBarras(
                  label: "V",
                  value1: 24,
                  value2: 20,
                  name1: 'Productos',
                  name2: 'Servicios'),
            ],
          ),
        ),
      ),
    );
  }
}
