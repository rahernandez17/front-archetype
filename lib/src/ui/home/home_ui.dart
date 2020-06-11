import 'package:flutter/material.dart';
import 'package:front_archetype/src/bloc/certificate_bloc.dart';
import 'package:front_archetype/src/bloc/request_bloc.dart';
import 'package:front_archetype/src/utils/alert_util.dart';
import 'package:front_archetype/src/utils/constants.dart';

class HomePage extends StatefulWidget {
  
  @override
  State createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {

  final CertificateBloc certificateBloc = CertificateBloc();
  final RequestBloc requestBloc = RequestBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.homeName),
        backgroundColor: Constants.bluePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Constants.bluePrimary,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Constants.blueSecondary,
              onPressed: () async {
                var message = await certificateBloc.enviarCertificado();
                AlertUtil.showDialogAlert(context, "Alerta!", message);
              },
              child: Text(
                "Certificado a email",
                style: TextStyle(fontSize: 20.0),
              ),
            )           
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var message = await requestBloc.enviarSolicitudEmail();
          AlertUtil.showDialogAlert(context, "Alerta!", message);
        },
        child: Icon(Icons.navigation),
        backgroundColor: Constants.bluePrimary,
        splashColor: Constants.blueSecondary,
      ),
    );
  }

}
