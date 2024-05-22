import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/app_state.dart';
import 'package:hackathon/constants.dart';
import 'package:hackathon/env/env.dart';
import 'package:hackathon/home2.dart';
import 'package:hackathon/util.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OpenAI.apiKey = Env.apiKey;
  final savedThemeMode = await AdaptiveTheme.getThemeMode() ?? AdaptiveThemeMode.light;
  final String savedThemeColor = await Util.getSavedThemeColor();
  final ColorSeed savedColorSeed = ColorSeed.values.firstWhere((element) => element.label == savedThemeColor,orElse: () => ColorSeed.baseColor);
  runApp(ChangeNotifierProvider(
            create: (_)=> AppState(savedThemeMode, savedColorSeed),
            builder: (context, child) => const MyApp(), ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        colorSchemeSeed: context.watch<AppState>().currentColorSeed.color,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true
      ),
      dark: ThemeData(
        colorSchemeSeed: context.watch<AppState>().currentColorSeed.color,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true
      ),
      initial: AdaptiveThemeMode.system,
      builder: (theme,darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        home: const HomePage(title: "Investments"),)); 
  }
}
