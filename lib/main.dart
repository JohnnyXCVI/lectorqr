import 'package:flutter/material.dart';
import 'package:lectorqr/pages/home_page.dart';
import 'package:lectorqr/pages/mapa_page.dart';
import 'package:lectorqr/providers/ui_provider.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lector QR',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'mapa': (_) => MapaPage()
        },
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.blueAccent
          )
        ),
      ),
    );
  }
}