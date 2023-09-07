import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_assistant/src/feature/deals/presentation/state/deals_screen_cubit.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/deal.dart';

class DealsScreen extends StatelessWidget {
  const DealsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealsCubit, DealsCubitState>(
      builder: (context, state) {
        final dealsCount = context.read<DealsCubit>().initState().deals.length;
        final initialDeals = context.read<DealsCubit>().initState().deals;

        if (dealsCount == 0) {
          return SizedBox(
            child: OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, '/addDeal'),
              child: Text(AppLocalizations.of(context)!.firstDealTitleBtn),
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
                onPressed: () => Navigator.pushNamed(context, '/addDeal'),
                child: Text(AppLocalizations.of(context)!.addDealTitleBtn),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView.builder(
              itemCount: dealsCount,
              itemBuilder: (context, index) {
                var deal = initialDeals[index];
                // TODO подумать над сортировкой сделок. Если сделка завершена, ее необходимо переместить в конец списка.
                return DealScreen(
                  deal: deal,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
