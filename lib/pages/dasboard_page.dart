import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:negocios_col_panel/models/busquedas_model.dart';
import 'package:negocios_col_panel/models/descargas_model.dart';
import 'package:negocios_col_panel/models/estadisticas_model.dart';
import 'package:negocios_col_panel/models/totales_dias_model.dart';
import 'package:negocios_col_panel/models/totales_models.dart';
import 'package:negocios_col_panel/widgets/grafico_sercular.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    getData();

    super.initState();
  }

  TotalesDiasModel? totalesDias;
  TotalModel? totales;
  List<Busquedamodel>? busquedas;
  List<Descargamodel>? descargas;
  List<Estadisticamodel>? estadisticas;

  @override
  Widget build(BuildContext context) {
    final color = const Color.fromARGB(255, 32, 32, 93);
    return Theme(
      data: Theme.of(context).copyWith(scaffoldBackgroundColor: color),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          centerTitle: true,
          title: const Text(
            'Dashboard',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardsData(totales: totalesDias),
            Container(
              constraints: BoxConstraints(
                maxWidth: 350,
                minWidth: 100,
                minHeight: 100,
                // maxHeight: 250,
              ),
              child: Card.filled(
                color: const Color.fromARGB(255, 56, 115, 125),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: GraficoCircular(data: [
                    ItemGraficoCircular(
                      label: "Descargas",
                      value: (totales?.descargas ?? 0).toDouble(),
                    ),
                    ItemGraficoCircular(
                      label: "Negocios",
                      value: (totales?.negocios ?? 0).toDouble(),
                    ),
                    ItemGraficoCircular(
                      label: "En Uso",
                      value: (totales?.negociosPS ?? 0).toDouble(),
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getData() async {
    var request =
        http.Request('GET', Uri.parse('http://localhost:8081/api/graficas'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final data = jsonDecode(await response.stream.bytesToString());
      totalesDias =
          TotalesDiasModel.fromMap((data['totalesdias'] as List).last);
      totales = TotalModel.fromMap(data['totales']);
      busquedas = (data['busquedas'] as List)
          .map((e) => Busquedamodel.fromMap(e))
          .toList();
      descargas = (data['descargas'] as List)
          .map((e) => Descargamodel.fromMap(e))
          .toList();
      estadisticas = (data['estadisticas'] as List)
          .map((e) => Estadisticamodel.fromMap(e))
          .toList();

      setState(() {});
    } else {
      print(response.reasonPhrase);
    }
  }
}

class CardsData extends StatelessWidget {
  const CardsData({
    super.key,
    required this.totales,
  });

  final TotalesDiasModel? totales;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15,
      alignment: WrapAlignment.center,
      children: [
        Card.filled(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Negocios",
                    style: Theme.of(context).textTheme.headlineLarge),
                Text((totales?.negocios ?? 0).toString(),
                    style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
          ),
        ),
        Card.filled(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Servicios",
                    style: Theme.of(context).textTheme.headlineLarge),
                Text((totales?.servicios ?? 0).toString(),
                    style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
          ),
        ),
        Card.filled(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Productos",
                    style: Theme.of(context).textTheme.headlineLarge),
                Text((totales?.productos ?? 0).toString(),
                    style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
          ),
        ),
        Card.filled(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Búsquedas",
                    style: Theme.of(context).textTheme.headlineLarge),
                Text((totales?.busquedas ?? 0).toString(),
                    style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
