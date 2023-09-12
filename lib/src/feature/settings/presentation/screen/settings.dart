import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:investment_assistant/src/ui/widgets/dropdown.dart';
import 'package:investment_assistant/src/ui/widgets/exit_modal.dart';
import '../../../../blocs/main/main_cubit.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  _showSimpleModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const ExitModal();
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainCubitState>(
      builder: (context, state) {
        return Scaffold(
            body: ValueListenableBuilder<Box>(
                valueListenable: Hive.box('settings').listenable(),
                builder: (context, box, widget) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 30.0),
                    child: ListView(
                      children: [
                        ListTile(
                          tileColor: Colors.transparent,
                          title: Text(
                            AppLocalizations.of(context)!.profile,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          trailing: Icon(
                            Icons.person,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                        ),
                        ListTile(
                          tileColor: Colors.transparent,
                          title: Text(
                            AppLocalizations.of(context)!.changeLanguage,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          trailing: const LanguageMenu(),
                        ),
                        ListTile(
                            tileColor: Colors.transparent,
                            title: Text(
                              AppLocalizations.of(context)!.changeTheme,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            trailing: Switch(
                              activeColor: Theme.of(context).primaryColor,
                              thumbColor:
                                  Theme.of(context).switchTheme.thumbColor,
                              trackColor:
                                  Theme.of(context).switchTheme.trackColor,
                              value: box.get('isDarkMode',
                                  defaultValue: false),
                              onChanged: (value) {
                                box.put('isDarkMode', value);
                                context.read<MainCubit>().changeTheme(value);
                              },
                            ),
                            contentPadding: const EdgeInsets.only(left: 14.0)),
                        ListTile(
                          tileColor: Colors.transparent,
                          title: Text(
                            AppLocalizations.of(context)!.exitInApp,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.red),
                          ),
                          trailing: const Icon(
                            Icons.exit_to_app,
                            color: Colors.red,
                          ),
                          onTap: () => _showSimpleModalDialog(context),
                        ),
                      ],
                    ),
                  );
                }));
      },
    );
  }
}
