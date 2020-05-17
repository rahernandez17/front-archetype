import 'package:flutter/material.dart';
import 'package:front_archetype/src/bloc/saludo_bloc.dart';
import 'package:front_archetype/src/models/saludo.dart';
import 'package:front_archetype/src/utils/constants.dart';

class HomePage extends StatefulWidget {
  
  @override
  State createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {

  final SaludoBloc saludoBloc = SaludoBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.homeName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Saludo>(
              future: saludoBloc.saludar("Raul"),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return Text(snapshot.data.saludo);
                } else if (snapshot.hasError){
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      )
    );
  }
}
