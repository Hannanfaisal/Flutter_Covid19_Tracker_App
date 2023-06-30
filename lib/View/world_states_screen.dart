import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/Models/world_states_model.dart';
import 'package:flutter_covid_tracker/Services/Utilities/states_services.dart';
import 'package:flutter_covid_tracker/View/countries_list_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

const textStyling = TextStyle(fontSize: 18, fontWeight: FontWeight.w400);

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 10), vsync: this);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final List<Color> colorList = [
    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246)
  ];

  // final list =<Color> [
  //   const Color(0xff4285f4),
  //   const Color(0xff1aa260),
  //   const Color(0xffde5246)
  // ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                  future: statesServices.fetchWorldStates(),
                  builder:
                      ((context, AsyncSnapshot<WorldStatesModel> snapshot) {
                    if (!snapshot.hasData) {
                      return SpinKitFadingCircle(
                        controller: _controller,
                        color: Colors.greenAccent,
                        size: 60,
                      );
                    } else {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.03,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.08),
                            child: PieChart(
                              dataMap: {
                                "Total": double.parse(
                                    snapshot.data!.cases!.toString()),
                                "Recovered": double.parse(
                                    snapshot.data!.recovered.toString()),
                                "Deaths": double.parse(
                                    snapshot.data!.deaths.toString()),
                              },
                              animationDuration:
                                  const Duration(milliseconds: 1200),
                              chartRadius: 140,
                              chartType: ChartType.ring,
                              ringStrokeWidth: 25,
                              colorList: colorList,
                              legendOptions: const LegendOptions(
                                showLegends: true,
                                showLegendsInRow: false,
                                legendPosition: LegendPosition.right,
                                legendShape: BoxShape.circle,
                                legendTextStyle: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              chartLegendSpacing: 45,
                              chartValuesOptions: const ChartValuesOptions(
                                  showChartValueBackground: true,
                                  showChartValuesInPercentage: true,
                                  chartValueStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.02),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                children: [
                                  ReusableRow(
                                      title: 'Total Cases',
                                      value: snapshot.data!.cases.toString()),
                                  ReusableRow(
                                      title: 'Recovered Cases',
                                      value:
                                          snapshot.data!.recovered.toString()),
                                  ReusableRow(
                                    title: 'Total Deaths',
                                    value: snapshot.data!.deaths.toString(),
                                  ),
                                  ReusableRow(
                                      title: 'Today Cases',
                                      value:
                                          snapshot.data!.todayCases.toString()),
                                  ReusableRow(
                                    title: 'Today Recovered',
                                    value: snapshot.data!.todayRecovered
                                        .toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Today Deaths',
                                    value:
                                        snapshot.data!.todayDeaths.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Critical Cases',
                                    value: snapshot.data!.critical.toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CountriesListScreen()));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.05),
                              height: 55,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                  child: Text('Track Countries',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ))),
                            ),
                          )
                        ],
                      );
                    }
                  })),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String value;
  final String title;

  const ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: textStyling,
              ),
              Text(value)
            ],
          ),
          const SizedBox(
            height: 1,
          ),
          const Divider()
        ],
      ),
    );
  }
}
