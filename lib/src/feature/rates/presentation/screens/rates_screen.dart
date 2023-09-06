import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:investment_assistant/src/feature/rates/presentation/state/rates_screen_cubit.dart';

import 'rate_screen.dart';


class RatesScreen extends StatelessWidget {
  const RatesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatesCubit, RatesCubitState>(
      builder: (context, state) {
        final ratesCount = context.read<RatesCubit>().initState().rates.length;
        final initialRates = context.read<RatesCubit>().initState().rates;

        if (ratesCount == 0) {
          return SizedBox(
            child: OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, '/addRate'),
              child: Text(AppLocalizations.of(context)!.firstRateTitleBtn),
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
                onPressed: () => Navigator.pushNamed(context, '/addRate'),
                child: Text(AppLocalizations.of(context)!.addRateTitleBtn),
              ),
            ],
          ),
          body:  Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView.builder(
              itemCount: ratesCount,
              itemBuilder: (context, index) {
                var rate = initialRates[index];
                return RateScreen(
                  rate: rate,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
