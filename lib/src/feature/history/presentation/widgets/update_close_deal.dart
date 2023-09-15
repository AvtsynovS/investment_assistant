import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';
import 'package:investment_assistant/src/feature/deals/presentation/state/deals_screen_cubit.dart';
import 'package:investment_assistant/src/feature/history/presentation/state/history_screen_cubit.dart';
import 'package:investment_assistant/src/ui/screens/home_page.dart';

import '../../../../ui/widgets/my_form_field.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateCloseDeal extends StatefulWidget {
  const UpdateCloseDeal({required this.closeDeal, super.key});

  final Deal closeDeal;

  @override
  State<UpdateCloseDeal> createState() => _UpdateCloseDealState();
}

class _UpdateCloseDealState extends State<UpdateCloseDeal> {
  _UpdateCloseDealState();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _sellController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _sellController.text =
        widget.closeDeal.sell != null ? widget.closeDeal.sell.toString() : '';
  }

  @override
  void dispose() {
    _sellController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryCubitState>(
        builder: (context, state) {
      final closeDeals = context.read<HistoryCubit>();
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
                      fieldTitle: widget.closeDeal.assetsTitle,
                      enabled: false,
                      filled: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DropdownButtonFormField(
                      value: widget.closeDeal.assetsType,
                      items: [
                        DropdownMenuItem(
                          value: widget.closeDeal.assetsType,
                          child: Text(widget.closeDeal.assetsType == 'stock'
                              ? AppLocalizations.of(context)!.stock
                              : AppLocalizations.of(context)!.pound),
                        )
                      ],
                      onChanged: null,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.typeDeal,
                        border: const OutlineInputBorder(),
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MyFormField(
                      fieldTitle: widget.closeDeal.buy.toString(),
                      enabled: false,
                      filled: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MyFormField(
                      fieldTitle: widget.closeDeal.quantity.toString(),
                      enabled: false,
                      filled: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MyFormField(
                      fieldTitle: widget.closeDeal.additinalProfit != null
                          ? widget.closeDeal.additinalProfit.toString()
                          : '0',
                      enabled: false,
                      filled: true,
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
                          Deal deal = widget.closeDeal;
                          deal.sell = _sellController.text != ''
                              ? double.parse(_sellController.text)
                              : null;

                          closeDeals.restoreCloseDeal(deal);
                          dealsCubit.restoreDeal(deal);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const HomePage(selectedTab: 2);
                            }),
                          );
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
