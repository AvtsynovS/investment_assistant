import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:investment_assistant/src/feature/login/presentation/screen/login_screen.dart';
import 'package:investment_assistant/src/feature/registration/presentation/screen/registration_screen.dart';
import 'package:investment_assistant/src/feature/welcome_page/presentation/screen/welcome_screen.dart';
import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';
import 'package:investment_assistant/src/feature/history/presentation/state/history_screen_cubit.dart';
import 'package:investment_assistant/src/feature/rates/domain/models/rate_model.dart';
import 'package:investment_assistant/src/feature/rates/presentation/state/rates_screen_cubit.dart';
import 'package:investment_assistant/src/feature/settings/domain/models/main_settings_model.dart';
import 'package:investment_assistant/src/feature/settings/presentation/state/main_cubit.dart';
import 'package:investment_assistant/src/helpers/SecureStorag/storage_keys.dart';
import 'package:provider/provider.dart';

import 'package:investment_assistant/src/feature/deals/presentation/state/deals_screen_cubit.dart';
import 'package:investment_assistant/src/feature/rates/presentation/widgets/add_rate.dart';
import 'package:investment_assistant/src/feature/settings/presentation/screen/profile/profile.dart';
import 'package:investment_assistant/src/themes/src/custom_theme.dart';
import 'package:investment_assistant/src/ui/screens/home_page.dart';

import 'src/feature/deals/presentation/widgets/add_deal.dart';
import 'src/helpers/SecureStorag/secure_storag_model.dart';
import 'src/localizations/l10n/all_locales.dart';
import 'src/localizations/locale_provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DealAdapter());
  Hive.registerAdapter(RateAdapter());
  Hive.registerAdapter(MainSettingsAdapter());

  const secureStorage = FlutterSecureStorage();
  var key = await secureStorage.read(key: StorageKeys.boxKey);

  if (key == null) {
    final globalSettingsKey = Hive.generateSecureKey();
    SecureStoragModel().setToken(base64UrlEncode(globalSettingsKey));
    key = await secureStorage.read(key: StorageKeys.boxKey);
  }

  final encryptionKeyUint8List = base64Url.decode(key!);

  await Hive.openBox<MainSettings>('settings',
      encryptionCipher: HiveAesCipher(encryptionKeyUint8List));

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
    return ValueListenableBuilder<Box<MainSettings>>(
      valueListenable: Hive.box<MainSettings>("settings").listenable(),
      builder: (context, box, child) {
        final settings = box.get('isDarkMode',
            defaultValue: MainSettings(isDarkMode: false)) as MainSettings;
        final languageCode = box.get(
          'locale',
          defaultValue: MainSettings(
              isDarkMode: false, locale: AllLocale.all[0].languageCode),
        ) as MainSettings;
        final currentLocale = AllLocale.all.firstWhere(
            (locale) => locale.languageCode == languageCode.locale);
        return MultiBlocProvider(
          providers: [
            BlocProvider(
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
              return ChangeNotifierProvider<LocaleProvider>(
                create: (_) => LocaleProvider(),
                builder: (context, child) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    themeMode:
                        settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                    darkTheme: CustomTheme.darkTheme,
                    theme: CustomTheme.lightTheme,
                    supportedLocales: AllLocale.all,
                    locale: currentLocale,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    initialRoute: '/',
                    routes: {
                      '/': (context) => const WelcomePage(),
                      '/homePage': (context) => const HomePage(selectedTab: 0),
                      '/profile': (context) => const ProfilePage(),
                      '/addDeal': (context) => const AddDeal(),
                      '/addRate': (context) => const AddRate(),
                      '/login': (context) => const LoginForm(),
                      '/registration': (context) => const Registration(),
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
