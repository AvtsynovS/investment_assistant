import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:investment_assistant/src/feature/deals/presentation/state/deals_screen_cubit.dart';
import 'package:investment_assistant/src/feature/history/presentation/state/history_screen_cubit.dart';
import 'package:investment_assistant/src/feature/rates/presentation/state/rates_screen_cubit.dart';
import 'package:investment_assistant/src/feature/settings/domain/models/main_settings_model.dart';
import 'package:investment_assistant/src/feature/settings/presentation/state/main_cubit.dart';
import 'package:investment_assistant/src/helpers/SecureStorag/secure_storag_model.dart';

class DeleteProfileModal extends StatefulWidget {
  const DeleteProfileModal({
    super.key,
  });
  @override
  State<DeleteProfileModal> createState() => _DeleteProfileModalState();
}

class _DeleteProfileModalState extends State<DeleteProfileModal> {
  final settingsBox = Hive.box<MainSettings>("settings");

  void _welcomePage() {
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainCubitState>(
      builder: (context, state) {
        final settings = context.read<MainCubit>();
        final deals = context.read<DealsCubit>();
        final rates = context.read<RatesCubit>();
        final history = context.read<HistoryCubit>();
        return AlertDialog(
          content:
              Text(AppLocalizations.of(context)!.deleteProfileModalMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () =>
                  Navigator.pop(context, AppLocalizations.of(context)!.no),
              child: Text(AppLocalizations.of(context)!.no),
            ),
            TextButton(
              onPressed: () async {
                settings.setDefaultSettings();
                deals.setDefaultDeals();
                rates.setDefaultRates();
                history.setDefaultHistoryDeals();
                await SecureStoragModel().deleteProfile();
                _welcomePage();
              },
              child: Text(AppLocalizations.of(context)!.yes),
            ),
          ],
        );
      },
    );
  }
}
