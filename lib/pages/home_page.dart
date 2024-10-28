import 'package:flutter/material.dart';
import 'package:lectorqr/pages/direcciones_page.dart';
import 'package:lectorqr/pages/mapas_page.dart';
import 'package:lectorqr/providers/db_provider.dart';
import 'package:provider/provider.dart';
import 'package:lectorqr/providers/ui_provider.dart';
import 'package:lectorqr/widgets/custom_navbar.dart';
import 'package:lectorqr/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavbar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Obtener el select menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    //Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    //TODO: Temporal leer la BD
    DBProvider.db.database;

    switch (currentIndex) {
      case 0:
        return MapasPages();

      case 1:
        return DireccionesPages();

      default:
        return MapasPages();
    }
  }
}
