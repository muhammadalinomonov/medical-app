import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/screen/main/main_screen.dart';
import 'presentation/themes/theme_provider.dart';
import 'presentation/themes/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('uz'),
        Locale('ru'),
      ],
      path: 'assets/translation',
      useOnlyLangCode: true,
      fallbackLocale: Locale('ru'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Flutter Demo',
            theme: themeProvider.isDark ? MyThemes.dark():MyThemes.light(),
            debugShowCheckedModeBanner: false,
            home: MainScreen(),
          );
        },
      ),
    );
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyThemes.light(),
      darkTheme: MyThemes.dark(),
      themeMode: ThemeMode.system,
      home: MainScreen()/*ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: themeProvider.getTheme(),
              home: MainScreen(),
            );
          },
        ),
      )*/,
    );
  }
}
