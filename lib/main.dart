import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:investment_assistant/src/feature/deals/presentation/state/deals_screen_cubit.dart';
import 'package:investment_assistant/src/feature/rates/presentation/widgets/add_rate.dart';
import 'package:investment_assistant/src/feature/settings/presentation/screen/profile/profile.dart';
import 'src/blocs/main/main_cubit.dart';
import 'package:investment_assistant/src/themes/src/custom_theme.dart';

import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'src/feature/deals/presentation/widgets/add_deal.dart';
import 'src/feature/rates/presentation/state/rates_screen_cubit.dart';
import 'src/localizations/l10n/all_locales.dart';
import 'src/localizations/locale_provider.dart';

import 'package:investment_assistant/src/ui/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // Оборачиваем все приложение в Провайдер
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // (context) => ThemeBloc() - дает доступ к состояниям
          create: (BuildContext context) => MainCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => DealsCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => RatesCubit(),
        ),
      ],
      child: BlocBuilder<MainCubit, MainCubitState>(
        builder: (context, state) {
          return ChangeNotifierProvider<LocaleProvider>(
            create: (_) => LocaleProvider(),
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                // title: 'Investment Assistant',
                // themeMode: state.isSwitched ? ThemeMode.light : ThemeMode.dark,
                // darkTheme: ThemeData.dark(),
                // theme: ThemeData.light(),
                themeMode: state.isSwitched ? ThemeMode.dark : ThemeMode.light,
                darkTheme: CustomTheme.darkTheme,
                theme: CustomTheme.lightTheme,
                supportedLocales: AllLocale.all,
                locale: Provider.of<LocaleProvider>(context).locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                initialRoute: '/',
                routes: {
                  // '/': (context) => const ProfilePage(),
                  '/': (context) => const HomePage(selectedTab: 0),
                  '/profile': (context) => const ProfilePage(),
                  '/addDeal': (context) => const AddDeal(),
                  '/addRate': (context) => const AddRate(),
                  // '/authorization': (context) => const Authorization(),
                  // '/login': (context) => const LoginForm(),
                  // '/registration': (context) => const Registration(),
                  // '/setting': (context) => const Settings(),
                },
              );
            },
          );
        },
      ),
    );
  }
}
