import 'package:flutter/material.dart';
import '../models/report.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Reports with ChangeNotifier {
  List<Report> _reports = [];

  List<Report> get reports {
    return [..._reports];
  }

  Report _globalCases;

  Report get globalCases {
    return _globalCases;
  }

  Future getdata() async {
    final url = 'https://covid-193.p.rapidapi.com/statistics';
    final headers = {
      'x-rapidapi-key': '75414948fcmshecb8bf8a777aa6fp1d8753jsnef9acde04b8f',
      'x-rapidapi-host': 'covid-193.p.rapidapi.com',
    };

    final response = await http.get(url, headers: headers);
    final responseData = json.decode(response.body)['response'];

    responseData.forEach(
      (curVal) {
        if (curVal['country'] == 'All') {
          _globalCases = Report(
            country: curVal['country'],
            totalCases: curVal['cases']['total'].toString(),
            newCases: curVal['cases']['new'].toString(),
            activeCases: curVal['cases']['active'].toString(),
            criticalCases: curVal['cases']['critical'].toString(),
            recoveredCases: curVal['cases']['recovered'].toString(),
            totalDeaths: curVal['deaths']['total'].toString(),
          );
        } else {
          final report = Report(
            country: curVal['country'] == null ? '0' : curVal['country'],
            totalCases: curVal['cases']['total'] == null
                ? '0'
                : curVal['cases']['total'].toString(),
            newCases: curVal['cases']['new'] == null
                ? '0'
                : curVal['cases']['new'].toString(),
            activeCases: curVal['cases']['active'] == null
                ? '0'
                : curVal['cases']['active'].toString(),
            criticalCases: curVal['cases']['critical'] == null
                ? '0'
                : curVal['cases']['critical'].toString(),
            recoveredCases: curVal['cases']['recovered'] == null
                ? '0'
                : curVal['cases']['recovered'].toString(),
            totalDeaths: curVal['deaths']['total'] == null
                ? '0'
                : curVal['deaths']['total'].toString(),
          );
          _reports.add(report);
        }
      },
    );
    _reports.sort((a, b) => a.country.compareTo(b.country));
  }
}
