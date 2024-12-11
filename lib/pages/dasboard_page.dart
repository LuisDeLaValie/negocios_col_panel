import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:negocios_col_panel/models/busquedas_model.dart';
import 'package:negocios_col_panel/models/descargas_model.dart';
import 'package:negocios_col_panel/models/estadisticas_model.dart';
import 'package:negocios_col_panel/models/totales_dias_model.dart';
import 'package:negocios_col_panel/models/totales_models.dart';
import 'package:negocios_col_panel/widgets/grafico_sercular.dart';
import 'package:negocios_col_panel/widgets/graficos_doble_barras.dart';

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
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardsData(totales: totalesDias),
              const SizedBox(height: 50),
              Wrap(
                spacing: 25,
                children: [
                  Container(
                    constraints: const BoxConstraints(
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
                            value: (totales?.descargas ?? 1).toDouble(),
                          ),
                          ItemGraficoCircular(
                            label: "Negocios",
                            value: (totales?.negocios ?? 1).toDouble(),
                          ),
                          ItemGraficoCircular(
                            label: "En Uso",
                            value: (totales?.negociosPS ?? 1).toDouble(),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 350,
                      minWidth: 100,
                      minHeight: 100,
                      // maxHeight: 250,
                    ),
                    child: Card.filled(
                      color: const Color.fromARGB(255, 56, 115, 125),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: GraficosDobleBarras(
                          data: estadisticas?.map((e) {
                                late String label;

                                switch (int.parse(e.mes)) {
                                  case 1:
                                    label = "Ene";
                                    break;
                                  case 2:
                                    label = "Feb";
                                    break;
                                  case 3:
                                    label = "Mar";
                                    break;
                                  case 4:
                                    label = "Abr";
                                    break;
                                  case 5:
                                    label = "May";
                                    break;
                                  case 6:
                                    label = "Jun";
                                    break;
                                  case 7:
                                    label = "Jul";
                                    break;
                                  case 8:
                                    label = "Ago";
                                    break;
                                  case 9:
                                    label = "Sep";
                                    break;
                                  case 10:
                                    label = "Oct";
                                    break;
                                  case 11:
                                    label = "Nov";
                                    break;
                                  case 12:
                                    label = "Dic";
                                    break;
                                  default:
                                    label = "";
                                }

                                return ItemGraficosDobleBarras(
                                  name1: "Productos",
                                  name2: "Servicios",
                                  label: label,
                                  value1: e.productos.toDouble(),
                                  value2: e.servicios.toDouble(),
                                );
                              }).toList() ??
                              [],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
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
