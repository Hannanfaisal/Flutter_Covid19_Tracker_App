import 'package:flutter/material.dart';
import 'package:flutter_covid_tracker/Models/world_states_model.dart';
import 'package:flutter_covid_tracker/Services/Utilities/states_services.dart';
import 'package:flutter_covid_tracker/View/countries_detail_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              onChanged: (Value) {
                setState(() {});
              },
              keyboardType: TextInputType.text,
              cursorColor: Colors.green,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  iconColor: Colors.green,
                  hintText: 'Search country name',
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade100),
                    borderRadius: BorderRadius.circular(50),
                  )),
            ),
            Expanded(
                child: FutureBuilder(
                    future: StatesServices().fetchCountriesList(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                            itemCount: 9,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                  baseColor: Colors.grey,
                                  highlightColor: Colors.grey.shade300,
                                  child: ListTile(
                                      leading: Container(
                                        height: 40,
                                        width: 40,
                                        color: Colors.white,
                                      ),
                                      title: Container(
                                        height: 10,
                                        width: 180,
                                        color: Colors.white,
                                      ),
                                      subtitle: Container(
                                          height: 10,
                                          width: 180,
                                          color: Colors.white)));
                            });
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              String name = snapshot.data![index]['country'];
                              if (searchController.text.isEmpty) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CountriesDetailScreen(
                                                name: snapshot.data![index]
                                                    ['country'],
                                                image: snapshot.data![index]
                                                    ['countryInfo']['flag'],
                                                totalCases: snapshot
                                                    .data![index]['cases'],
                                                totalDeaths: snapshot
                                                    .data![index]['deaths'],
                                                recoverd: snapshot.data![index]
                                                    ['recovered'],
                                                critical: snapshot.data![index]
                                                    ['critical'])));
                                  },
                                  child: ListTile(
                                    leading: Image(
                                      width: 50,
                                      height: 50,
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag']),
                                    ),
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                  ),
                                );
                              } else if (name.toLowerCase().contains(
                                  searchController.text.toLowerCase())) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CountriesDetailScreen(
                                                name: snapshot.data![index]
                                                    ['country'],
                                                image: snapshot.data![index]
                                                    ['countryInfo']['flag'],
                                                totalCases: snapshot
                                                    .data![index]['cases'],
                                                totalDeaths: snapshot
                                                    .data![index]['deaths'],
                                                recoverd: snapshot.data![index]
                                                    ['recovered'],
                                                critical: snapshot.data![index]
                                                    ['critical'])));
                                  },
                                  child: ListTile(
                                    leading: Image(
                                      width: 50,
                                      height: 50,
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag']),
                                    ),
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text(snapshot.data![index]
                                            ['cases']
                                        .toString()),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            });
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
