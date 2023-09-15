import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';
import 'package:investment_assistant/src/feature/history/presentation/state/history_screen_cubit.dart';
import 'package:investment_assistant/src/feature/rates/domain/models/rate_model.dart';
import 'package:investment_assistant/src/feature/rates/presentation/state/rates_screen_cubit.dart';
import 'package:provider/provider.dart';

import 'package:investment_assistant/src/feature/deals/presentation/state/deals_screen_cubit.dart';
import 'package:investment_assistant/src/feature/rates/presentation/widgets/add_rate.dart';
import 'package:investment_assistant/src/feature/settings/presentation/screen/profile/profile.dart';
import 'package:investment_assistant/src/themes/src/custom_theme.dart';
import 'package:investment_assistant/src/ui/screens/home_page.dart';

import 'src/blocs/main/main_cubit.dart';
import 'src/feature/deals/presentation/widgets/add_deal.dart';
import 'src/localizations/l10n/all_locales.dart';
import 'src/localizations/locale_provider.dart';

// TODO подумать как обработать данные, в случае закрытия части позиции.
// Логика:
// 1. Ищем нужную сделку
// 2. Проверяем, если количество меньше чем было изначально в сделке и сделка закрывается - создаем отдельную закрытую сделку с указанным количеством. 
// При этом остатотк остается открытым.

// Или добавить отдельное поле "Продано, шт." и далее та же логика.
// В таком случае, нужна доп. проверка, если сделка закрывается, "Продано, шт." и "цена продажи" должно быть обязательно заполнено.

void main() async {
  Hive.registerAdapter(DealAdapter());
  Hive.registerAdapter(RateAdapter());
  await Hive.initFlutter();
  await Hive.openBox('settings');
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
    return ValueListenableBuilder(
        valueListenable: Hive.box('settings').listenable(),
        builder: (context, box, widget) {
          
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
              BlocProvider(
                create: (BuildContext context) => HistoryCubit(),
              ),
            ],
            child: BlocBuilder<MainCubit, MainCubitState>(
              builder: (context, state) {
                final isDarkMode = box.get('isDarkMode', defaultValue: false);
                return ChangeNotifierProvider<LocaleProvider>(
                  create: (_) => LocaleProvider(),
                  builder: (context, child) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      // title: 'Investment Assistant',
                      // themeMode: state.isSwitched ? ThemeMode.light : ThemeMode.dark,
                      // darkTheme: ThemeData.dark(),
                      // theme: ThemeData.light(),
                      themeMode:
                          isDarkMode ? ThemeMode.dark : ThemeMode.light,
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
        });
  }
}
