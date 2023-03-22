import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sl_post_air_mail_calculator/providers/rate_provider.dart';

import 'screens/home_page.dart';
import 'providers/country_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountryProvider()..loadCountries(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => RateProvider(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorSchemeSeed: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFFCF1839),
            foregroundColor: Colors.white,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
