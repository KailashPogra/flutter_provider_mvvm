import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/utils/routs/routs.dart';
import 'package:provider_mvvm/utils/routs/routs_name.dart';
import 'package:provider_mvvm/view_model/home_view_model.dart';
import 'package:provider_mvvm/view_model/login_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        initialRoute: RoutsName.home,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
