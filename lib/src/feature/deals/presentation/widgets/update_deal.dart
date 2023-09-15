import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';
import 'package:investment_assistant/src/feature/history/presentation/state/history_screen_cubit.dart';
import 'package:investment_assistant/src/feature/rates/presentation/state/rates_screen_cubit.dart';
import 'package:investment_assistant/src/helpers/get_profit.dart';
import 'package:investment_assistant/src/ui/screens/home_page.dart';

import '../../../../ui/widgets/my_form_field.dart';
import '../state/deals_screen_cubit.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateDeal extends StatefulWidget {
  const UpdateDeal({required this.deal, super.key});

  final Deal deal;

  @override
  State<UpdateDeal> createState() => _UpdateDealState();
}

class _UpdateDealState extends State<UpdateDeal> {
  _UpdateDealState();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleDealController = TextEditingController();
  final _quantityController = TextEditingController();
  final _buyController = TextEditingController();
  final _additinalProfitController = TextEditingController();
  final _sellController = TextEditingController();

  final _dealType = ['stock', 'pound'];
  String _selectedType = '';

  _showActiveRateError(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.rateError),
        content: Text(AppLocalizations.of(context)!.rateErrorDescription),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const HomePage(selectedTab: 1);
                }),
              );
            },
            child: Text(AppLocalizations.of(context)!.ok),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _titleDealController.text = widget.deal.assetsTitle;
    _quantityController.text = widget.deal.quantity.toString();
    _buyController.text = widget.deal.buy.toString();
    _selectedType = widget.deal.assetsType;
    _additinalProfitController.text = widget.deal.additinalProfit != null
        ? widget.deal.additinalProfit.toString()
        : '';
    _sellController.text =
        widget.deal.sell != null ? widget.deal.sell.toString() : '';
  }

  @override
  void dispose() {
    _titleDealController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealsCubit, DealsCubitState>(builder: (context, state) {
      final rates = context.read<RatesCubit>().state.rates;
      final historyCubit = context.read<HistoryCubit>();
      final dealsCubit = context.read<DealsCubit>();
      return Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 5.0,
                    ),
                    MyFormField(
                        fieldTitle: AppLocalizations.of(context)!.titleDeal,
                        myController: _titleDealController,
                        validation: (String? value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!.titleDealError;
                          }
                          return null;
                        },
                        hintText:
                            AppLocalizations.of(context)!.dealTitlePlaceholder),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DropdownButtonFormField(
                      value: _selectedType,
                      items: _dealType
                          .map(
                            (type) => DropdownMenuItem(
                              value: type,
                              child: Text(type == 'stock'
                                  ? AppLocalizations.of(context)!.stock
                                  : AppLocalizations.of(context)!.pound),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedType = value as String;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.typeDeal,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MyFormField(
                      fieldTitle: AppLocalizations.of(context)!.buy,
                      myController: _buyController,
                      typeField: TextInputType.number,
                      validation: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.buyDealError;
                        }
                        return null;
                      },
                      hintText:
                          AppLocalizations.of(context)!.dealPricePlaceholder,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MyFormField(
                      fieldTitle: AppLocalizations.of(context)!.quantity,
                      myController: _quantityController,
                      typeField: TextInputType.number,
                      validation: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!
                              .quantityDealError;
                        }
                        return null;
                      },
                      hintText:
                          AppLocalizations.of(context)!.dealQuantityPlaceholder,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MyFormField(
                      fieldTitle: _selectedType == 'stock'
                          ? AppLocalizations.of(context)!.dividends
                          : AppLocalizations.of(context)!.coupons,
                      myController: _additinalProfitController,
                      typeField: TextInputType.number,
                      hintText: _selectedType == 'stock'
                          ? AppLocalizations.of(context)!.dividendsSum
                          : AppLocalizations.of(context)!.couponsSum,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MyFormField(
                      fieldTitle: AppLocalizations.of(context)!.sellTitle,
                      myController: _sellController,
                      typeField: TextInputType.number,
                      hintText: AppLocalizations.of(context)!.sellPlaceholder,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Deal deal = Deal(
                            id: widget.deal.id,
                            assetsTitle: _titleDealController.text,
                            assetsType: _selectedType,
                            buy: double.parse(_buyController.text),
                            quantity: int.parse(_quantityController.text),
                            createAt: widget.deal.createAt,
                            sell: _sellController.text != ''
                                ? double.parse(_sellController.text)
                                : null,
                            additinalProfit: _additinalProfitController.text !=
                                    ''
                                ? double.parse(_additinalProfitController.text)
                                : null,
                          );

                          final activeRate = rates.isNotEmpty
                              ? rates.firstWhere(
                                  (element) => element.isActive == true)
                              : null;
                          if (_formKey.currentState!.validate() &&
                              _sellController.text != '' &&
                              activeRate == null) {
                            dealsCubit.updateDeal(deal);
                            _showActiveRateError(context);
                          }
                          if (_formKey.currentState!.validate() &&
                              _sellController.text == '' &&
                              activeRate == null) {
                            dealsCubit.updateDeal(deal);
                            Navigator.pushNamed(context, '/');
                          }

                          if (_formKey.currentState!.validate() &&
                              activeRate != null) {
                            final updateDeal = getProfit(deal, activeRate);
                            dealsCubit.updateDealBySell(updateDeal);

                            historyCubit.updateHistory(updateDeal);
                            Navigator.pushNamed(context, '/');
                          }
                        },
                        child: Text(
                            AppLocalizations.of(context)!.updateDealTitleBtn),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
