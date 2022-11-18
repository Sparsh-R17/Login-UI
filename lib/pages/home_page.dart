import 'package:coder/widgets/drawer.dart';
import 'package:coder/widgets/pie_chart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //const int day = 30;
    //const String greet = "Welcome";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Catalog App",
        style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: PieChartMaker(),
      ),
      drawer: const MyDrawer(),
    );
  }
}

