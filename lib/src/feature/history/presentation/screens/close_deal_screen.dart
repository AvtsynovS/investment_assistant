import 'package:flutter/material.dart';
import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:investment_assistant/src/feature/history/presentation/widgets/update_close_deal.dart';
import 'package:investment_assistant/src/themes/theme.dart';

class CloseDealScreen extends StatelessWidget {
  const CloseDealScreen({required this.closeDeal, super.key});

  final Deal closeDeal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return UpdateCloseDeal(closeDeal: closeDeal);
          }),
        );
      },
      child: Container(
        width: double.infinity,
        height: 120,
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
                  text: '${closeDeal.assetsTitle} ',
                  style: Theme.of(context).textTheme.titleLarge,
                  children: [
                    TextSpan(
                      text: closeDeal.assetsType == 'stock'
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
                          text: '${closeDeal.quantity}',
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
                  padding: const EdgeInsets.fromLTRB(0, 6.0, 0, 8.0),
                  child: RichText(
                    text: TextSpan(
                        text: closeDeal.assetsType == 'stock'
                            ? AppLocalizations.of(context)!.dividends
                            : AppLocalizations.of(context)!.coupons,
                        style: Theme.of(context).textTheme.bodySmall,
                        children: [
                          TextSpan(
                            text: closeDeal.additinalProfit != null
                                ? ' ${closeDeal.additinalProfit}'
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
                  width: 180.0,
                  child: RichText(
                    maxLines: 2,
                    text: TextSpan(
                      text:
                          '${AppLocalizations.of(context)!.yield}, ${AppLocalizations.of(context)!.rub}:  ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: closeDeal.profit != null
                          ? [
                              TextSpan(
                                text:
                                    closeDeal.profit?.toStringAsFixed(2) ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: (closeDeal.profit != null &&
                                              closeDeal.profit!.isNegative)
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        closeDeal.closeAt != null
                            ? '${closeDeal.createAt} - ${closeDeal.closeAt}'
                            : '${closeDeal.createAt}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: AppColors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5.0, 2.0, 8.0),
                      child: Icon(
                        Icons.circle,
                        size: 10.0,
                        color: closeDeal.status
                            ? AppColors.activeColor
                            : AppColors.deactiveColor,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: RichText(
                    text: TextSpan(
                      text: '${AppLocalizations.of(context)!.buy}: ',
                      style: Theme.of(context).textTheme.bodySmall,
                      children: [
                        TextSpan(
                          text: '${closeDeal.buy}',
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
                          text: closeDeal.sell?.toString() ?? '',
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
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        text: '${AppLocalizations.of(context)!.yield}, %:  ',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: closeDeal.profit != null
                            ? [
                                TextSpan(
                                  text: closeDeal.profitPersent
                                          ?.toStringAsFixed(2) ??
                                      '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: (closeDeal.profit != null &&
                                                closeDeal.profit!.isNegative)
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
