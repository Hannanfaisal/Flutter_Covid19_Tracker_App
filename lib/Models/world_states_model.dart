
class WorldStatesModel {
  int? updated;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  double? deathsPerOneMillion;
  int? tests;
  double? testsPerOneMillion;
  int? population;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;
  int? affectedCountries;

  WorldStatesModel({this.updated, this.cases, this.todayCases, this.deaths, this.todayDeaths, this.recovered, this.todayRecovered, this.active, this.critical, this.casesPerOneMillion, this.deathsPerOneMillion, this.tests, this.testsPerOneMillion, this.population, this.oneCasePerPeople, this.oneDeathPerPeople, this.oneTestPerPeople, this.activePerOneMillion, this.recoveredPerOneMillion, this.criticalPerOneMillion, this.affectedCountries});

  WorldStatesModel.fromJson(Map<String, dynamic> json) {
    if(json["updated"] is int)
      updated = json["updated"];
    if(json["cases"] is int)
      cases = json["cases"];
    if(json["todayCases"] is int)
      todayCases = json["todayCases"];
    if(json["deaths"] is int)
      deaths = json["deaths"];
    if(json["todayDeaths"] is int)
      todayDeaths = json["todayDeaths"];
    if(json["recovered"] is int)
      recovered = json["recovered"];
    if(json["todayRecovered"] is int)
      todayRecovered = json["todayRecovered"];
    if(json["active"] is int)
      active = json["active"];
    if(json["critical"] is int)
      critical = json["critical"];
    if(json["casesPerOneMillion"] is int)
      casesPerOneMillion = json["casesPerOneMillion"];
    if(json["deathsPerOneMillion"] is double)
      deathsPerOneMillion = json["deathsPerOneMillion"];
    if(json["tests"] is int)
      tests = json["tests"];
    if(json["testsPerOneMillion"] is double)
      testsPerOneMillion = json["testsPerOneMillion"];
    if(json["population"] is int)
    population = json["population"];
    if(json["oneCasePerPeople"] is int)
      oneCasePerPeople = json["oneCasePerPeople"];
    if(json["oneDeathPerPeople"] is int)
      oneDeathPerPeople = json["oneDeathPerPeople"];
    if(json["oneTestPerPeople"] is int)
      oneTestPerPeople = json["oneTestPerPeople"];
    if(json["activePerOneMillion"] is double)
      activePerOneMillion = json["activePerOneMillion"];
    if(json["recoveredPerOneMillion"] is double)
      recoveredPerOneMillion = json["recoveredPerOneMillion"];
    if(json["criticalPerOneMillion"] is double)
      criticalPerOneMillion = json["criticalPerOneMillion"];
    if(json["affectedCountries"] is int)
      affectedCountries = json["affectedCountries"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["updated"] = this.updated;
    data["cases"] = this.cases;
    data["todayCases"] = this.todayCases;
    data["deaths"] = this.deaths;
    data["todayDeaths"] = this.todayDeaths;
    data["recovered"] = this.recovered;
    data["todayRecovered"] = this.todayRecovered;
    data["active"] = this.active;
    data["critical"] = this.critical;
    data["casesPerOneMillion"] = this.casesPerOneMillion;
    data["deathsPerOneMillion"] = this.deathsPerOneMillion;
    data["tests"] = this.tests;
    data["testsPerOneMillion"] = this.testsPerOneMillion;
    data["population"] = this.population;
    data["oneCasePerPeople"] = this.oneCasePerPeople;
    data["oneDeathPerPeople"] = this.oneDeathPerPeople;
    data["oneTestPerPeople"] = this.oneTestPerPeople;
    data["activePerOneMillion"] = this.activePerOneMillion;
    data["recoveredPerOneMillion"] = this.recoveredPerOneMillion;
    data["criticalPerOneMillion"] = this.criticalPerOneMillion;
    data["affectedCountries"] = this.affectedCountries;
    return data;
  }
}