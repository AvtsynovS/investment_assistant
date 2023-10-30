import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';

import '../../../../ui/widgets/my_form_field.dart';
import '../state/deals_screen_cubit.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddDeal extends StatefulWidget {
  const AddDeal({super.key});

  @override
  State<AddDeal> createState() => _AddDealState();
}

class _AddDealState extends State<AddDeal> {
  _AddDealState() {
    _selectedType = _dealType[0];
  }

  final notificationId = UniqueKey().hashCode;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleDealController = TextEditingController();
  final _quantityController = TextEditingController();
  final _buyController = TextEditingController();

  final _dealType = ['stock', 'pound'];
  String _selectedType = '';

  @override
  void dispose() {
    _titleDealController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealsCubit, DealsCubitState>(builder: (context, state) {
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
                      autofocus: true,
                      hintText:
                          AppLocalizations.of(context)!.dealTitlePlaceholder,
                    ),
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
                            AppLocalizations.of(context)!.dealPricePlaceholder),
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
                        hintText: AppLocalizations.of(context)!
                            .dealQuantityPlaceholder),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Deal deal = Deal(
                                id: notificationId,
                                assetsTitle: _titleDealController.text,
                                assetsType: _selectedType,
                                buy: double.parse(_buyController.text),
                                quantity: int.parse(_quantityController.text),
                                createAt:
                                    DateFormat('dd.MM.yyyy').format(DateTime.now()),
                                status: true);
                            context.read<DealsCubit>().addDeal(deal);
                            Navigator.pushNamed(context, '/homePage');
                          }
                        },
                        child:
                            Text(AppLocalizations.of(context)!.addDealTitleBtn),
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
