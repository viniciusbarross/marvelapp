import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:heroesapp/core/theme_consts.dart';
import 'package:heroesapp/features/character/domain/usecases/get_characteres.dart';
import 'package:heroesapp/features/character/presentation/controller/character_controller.dart';
import 'package:heroesapp/features/character/presentation/heroes_screen.dart';

import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CharacterController(getCharacters: GetIt.I.get<GetCharacters>()),
        child: MaterialApp(
          title: 'Favorites websites',
          theme: ThemeData(
            buttonTheme: const ButtonThemeData(buttonColor: Color(secondaryColor)),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: const Color(secondaryColor),
              contentPadding: const EdgeInsets.all(10),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: primaryColor),
                borderRadius: BorderRadius.circular(40.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
            ),
            appBarTheme: const AppBarTheme(color: Color(secondaryColor)),
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.deepPurple, secondary: const Color(secondaryColor), primary: primaryColor),
            useMaterial3: true,
          ),
          home: const HeroesScreen(),
        ));
  }
}
