import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/helper/router.dart';
import 'package:todo/utils/app_theme.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:todo/view/screens/welcom_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(
    //?--- ProviderScope allow us to use riverpod in our project.
    ProviderScope(
      child: MyApp(savedThemeMode: savedThemeMode),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({Key? key, this.savedThemeMode}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //?--- AdaptiveTheme allow us to switch dark and light theme.
    return AdaptiveTheme(
      light: AppTheme.lightTheme,
      dark: AppTheme.darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo',
        theme: theme,
        darkTheme: darkTheme,
        initialRoute: WelcomScreen.route,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
