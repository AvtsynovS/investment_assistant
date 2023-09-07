import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';
import 'package:investment_assistant/src/feature/deals/presentation/state/deals_screen_cubit.dart';
import 'package:investment_assistant/src/feature/deals/presentation/widgets/update_deal.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:investment_assistant/src/themes/theme.dart';

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
        height: 130,
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
                RichText(
                    text: TextSpan(
                  text: '${deal.assetsTitle} ',
                  style: Theme.of(context).textTheme.titleLarge,
                  children: [
                    TextSpan(
                      text: deal.assetsType == 'stock'
                          ? AppLocalizations.of(context)!.stock
                          : AppLocalizations.of(context)!.pound,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                )),
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
                                    color: AppColors.profitColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 6.0, 0, 5.0),
                  child: RichText(
                    text: TextSpan(
                        text: deal.assetsType == 'stock'
                            ? AppLocalizations.of(context)!.dividends
                            : AppLocalizations.of(context)!.coupons,
                        style: Theme.of(context).textTheme.bodySmall,
                        children: [
                          TextSpan(
                            text: deal.additinalProfit != null
                                ? ' ${deal.additinalProfit}'
                                : '',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: AppColors.profitColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  width: 200.0,
                  child: RichText(
                    maxLines: 2,
                    text: TextSpan(
                      text:
                          '${AppLocalizations.of(context)!.yield}, ${AppLocalizations.of(context)!.rub}:  ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: deal.profit != null
                          ? [
                              TextSpan(
                                text: deal.profit?.toStringAsFixed(2) ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: (deal.profit != null &&
                                              deal.profit!.isNegative)
                                          ? AppColors.lesionColor
                                          : AppColors.profitColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ]
                          : [],
                    ),
                  ),
                ),
                SizedBox(
                  width: 200.0,
                  child: RichText(
                    maxLines: 2,
                    text: TextSpan(
                      text: '${AppLocalizations.of(context)!.yield}, %:  ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: deal.profit != null
                          ? [
                              TextSpan(
                                text: deal.profitPersent?.toStringAsFixed(2) ??
                                    '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: (deal.profit != null &&
                                              deal.profit!.isNegative)
                                          ? AppColors.lesionColor
                                          : AppColors.profitColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ]
                          : [],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5.0, 2.0, 8.0),
                  child: Icon(
                    Icons.circle,
                    size: 10.0,
                    color: deal.status
                        ? AppColors.activeColor
                        : AppColors.deactiveColor,
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
                                    color: AppColors.profitColor,
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
                          text: deal.sell?.toString() ?? '',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.profitColor,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
