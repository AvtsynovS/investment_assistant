import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:investment_assistant/src/feature/rates/presentation/state/rates_screen_cubit.dart';

import '../../domain/models/rate_model.dart';
import '../widgets/update_rate.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({required this.rate, super.key});

  final Rate rate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return UpdateRate(rate: rate);
          }),
        );
      },
      onLongPress: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(AppLocalizations.of(context)!.deleteRateTitle),
          content: Text(AppLocalizations.of(context)!.deleteRateDescription),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            TextButton(
              onPressed: () {
                context.read<RatesCubit>().deleteRate(rate.id);
                Navigator.pop(context, 'OK');
              },
              child: Text(AppLocalizations.of(context)!.ok),
            ),
          ],
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 115,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Theme.of(context).listTileTheme.tileColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rate.rateTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: RichText(
                    text: TextSpan(
                      text: '${AppLocalizations.of(context)!.commission}: ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: '${rate.transactionCommission}',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: const Color(0xFF06BF28),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                rate.monthlyCommission != 0
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: RichText(
                          text: TextSpan(
                            text:
                                '${AppLocalizations.of(context)!.monthlyCommission}: ',
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                              TextSpan(
                                text: '${rate.monthlyCommission}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: const Color(0xFF06BF28),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
            Icon(
              Icons.circle,
              size: 10.0,
              color: rate.isActive
                  ? const Color(0xFF07CF25)
                  : const Color(0xFFF51000),
            ),
          ],
        ),
      ),
    );
  }
}
