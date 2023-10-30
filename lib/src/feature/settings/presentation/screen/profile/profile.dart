import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:investment_assistant/src/feature/rates/presentation/state/rates_screen_cubit.dart';
import 'package:investment_assistant/src/feature/settings/presentation/state/main_cubit.dart';
import 'package:investment_assistant/src/feature/settings/presentation/widgets/change_login_form.dart';
import 'package:investment_assistant/src/feature/settings/presentation/widgets/change_password_form.dart';
import 'package:investment_assistant/src/feature/settings/presentation/widgets/change_rate_form.dart';

import 'profile_menu_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double size = 120;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box('settings').listenable(),
        builder: (context, box, widget) {
          return BlocBuilder<MainCubit, MainCubitState>(
            builder: (context, state) {
              final settingsCubit = context.read<MainCubit>();
              final activeRate = context.read<RatesCubit>().getCurrentRate();
              final String? avatar = box.get(
                'avatar',
              );

              return Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.profile,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Container(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: size,
                            height: size,
                            child: CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              radius: 85,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: avatar != null
                                        ? MemoryImage(base64.decode(avatar))
                                        : state.avatar,
                                    maxRadius: 55,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                      child: FloatingActionButton(
                                        onPressed: () => context
                                            .read<MainCubit>()
                                            .setAvatar(),
                                        child: Icon(
                                          size: 20,
                                          Icons.edit,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          FutureBuilder(
                            future: settingsCubit.readSecureLogin(),
                            builder: (context, snapshot) {
                              return Text(
                                snapshot.data != null
                                    ? "${snapshot.data}"
                                    : AppLocalizations.of(context)!.defaultName,
                                style: Theme.of(context).textTheme.bodyMedium,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            activeRate != null
                                ? "${AppLocalizations.of(context)!.activeRate} ${activeRate.rateTitle}"
                                : AppLocalizations.of(context)!.activeRate,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          const Divider(
                            color: Colors.transparent,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ProfileMenuItem(
                            title: AppLocalizations.of(context)!.changeName,
                            icon: Icon(
                              Icons.person,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChangeLogin(),
                                ),
                              );
                            },
                          ),
                          ProfileMenuItem(
                            title: AppLocalizations.of(context)!.changePassword,
                            icon: Icon(
                              Icons.password,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChangePassword(),
                                ),
                              );
                            },
                          ),
                          ProfileMenuItem(
                            title: AppLocalizations.of(context)!.changeRate,
                            icon: Icon(
                              Icons.work_history_outlined,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChangeRate(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          );
        });
  }
}
