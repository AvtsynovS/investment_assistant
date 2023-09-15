import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';

import 'package:investment_assistant/src/feature/history/presentation/state/history_screen_cubit.dart';

import 'package:investment_assistant/src/feature/history/presentation/screens/close_deal_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryCubitState>(
      builder: (context, state) {
        final closeDealsCount =
            context.read<HistoryCubit>().initState().closeDeals.length;
        final initialCloseDeals =
            context.read<HistoryCubit>().initState().closeDeals;

        if (closeDealsCount == 0) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              child: Text(
                AppLocalizations.of(context)!.historyEmptyText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          );
        }

        return Scaffold(
          // TODO Настроить тему для AppBar
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            actions: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(style: BorderStyle.none)),
                onPressed: () {},
                // onPressed: () => Navigator.pushNamed(context, '/addDeal'),
                child: const Text('Добавить фильтр по имени и периоду'),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView.builder(
              itemCount: closeDealsCount,
              itemBuilder: (context, index) {
                Deal closeDeal = initialCloseDeals[index];
                return CloseDealScreen(
                  closeDeal: closeDeal,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
