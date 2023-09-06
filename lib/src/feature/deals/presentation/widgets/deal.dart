import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';
import 'package:investment_assistant/src/feature/deals/presentation/state/deals_screen_cubit.dart';
import 'package:investment_assistant/src/feature/deals/presentation/widgets/update_deal.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DealScreen extends StatelessWidget {
  const DealScreen({required this.deal, super.key});

  final Deal deal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return UpdateDeal(deal: deal);
          }),
        );
      },
      onLongPress: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(AppLocalizations.of(context)!.deleteDealTitle),
          content: Text(AppLocalizations.of(context)!.deleteDealDescription),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            TextButton(
              onPressed: () {
                context.read<DealsCubit>().deleteDeal(deal.id);
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
                  deal.assetsTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: RichText(
                    text: TextSpan(
                      text: '${AppLocalizations.of(context)!.quantity}: ',
                      style: Theme.of(context).textTheme.bodySmall,
                      children: [
                        TextSpan(
                          text: '${deal.quantity}',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: const Color(0xFF06BF28),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    deal.assetsType == 'stock'
                        ? AppLocalizations.of(context)!.stock
                        : AppLocalizations.of(context)!.pound,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    text: '+200 ${AppLocalizations.of(context)!.rub}',
                    style: Theme.of(context).textTheme.titleLarge,
                    children: [
                      TextSpan(
                        text: ' | ',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: const Color(0xFF07CF25),
                            ),
                      ),
                      TextSpan(
                        text: '-20%',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: RichText(
                    text: TextSpan(
                      text: '${AppLocalizations.of(context)!.buy}: ',
                      style: Theme.of(context).textTheme.bodySmall,
                      children: [
                        TextSpan(
                          text: '${deal.buy}',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: const Color(0xFF07CF25),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        TextSpan(
                          text: ' ${AppLocalizations.of(context)!.rub}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: RichText(
                    text: TextSpan(
                      text: '${AppLocalizations.of(context)!.sell}: ',
                      style: Theme.of(context).textTheme.bodySmall,
                      children: [
                        TextSpan(
                          text: deal.sell != null ? deal.sell.toString() : '',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: const Color(0xFF07CF25),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        TextSpan(
                          text: ' ${AppLocalizations.of(context)!.rub}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8.0, 2.0, 0.0),
                  child: Icon(
                    Icons.circle,
                    size: 10.0,
                    color: deal.status
                        ? const Color(0xFF07CF25)
                        : const Color(0xFFF51000),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
