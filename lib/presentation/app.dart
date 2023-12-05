import 'package:flutter/material.dart';
import 'package:pessoa_crud/presentation/router.dart';


class CRUDPersonApp extends StatelessWidget{
  const CRUDPersonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Crud do Leandrão",
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      theme: ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light
        )
      ),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light
        )
      )
    );
  }


}