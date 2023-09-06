import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_assistant/src/feature/rates/presentation/state/rates_screen_cubit.dart';
import 'package:investment_assistant/src/ui/screens/home_page.dart';

import '../../../../ui/widgets/my_form_field.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../domain/models/rate_model.dart';

class AddRate extends StatefulWidget {
  const AddRate({super.key});

  @override
  State<AddRate> createState() => _AddRateState();
}

class _AddRateState extends State<AddRate> {
  _AddRateState();

  final notificationId = UniqueKey().hashCode;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleRateController = TextEditingController();
  final _monthlyCommissionController = TextEditingController();
  final _transactionCommissionController = TextEditingController();
  bool _isMonthlyCommission = false;
  bool _isActive = false;

  @override
  void dispose() {
    _titleRateController.dispose();
    _monthlyCommissionController.dispose();
    _transactionCommissionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatesCubit, RatesCubitState>(builder: (context, state) {
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
                      fieldTitle: AppLocalizations.of(context)!.titleRate,
                      myController: _titleRateController,
                      validation: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.titleRateError;
                        }
                        return null;
                      },
                      autofocus: true,
                      hintText:
                          AppLocalizations.of(context)!.titleRatePlaceholder,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MyFormField(
                      fieldTitle: AppLocalizations.of(context)!
                          .transactionCommissionRateTitle,
                      myController: _transactionCommissionController,
                      typeField: TextInputType.number,
                      validation: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!
                              .transactionCommissionRateError;
                        }
                        return null;
                      },
                      hintText: AppLocalizations.of(context)!
                          .transactionCommissionPlaceholder,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CheckboxListTile(
                      title: Text(
                          '${AppLocalizations.of(context)!.monthlyCommission}:'),
                      contentPadding: const EdgeInsets.only(left: 10.0),
                      enableFeedback: true,
                      tileColor: Colors.transparent,
                      value: _isMonthlyCommission,
                      onChanged: (value) {
                        setState(() {
                          _isMonthlyCommission = !_isMonthlyCommission;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _isMonthlyCommission
                        ? Column(
                            children: [
                              MyFormField(
                                fieldTitle: AppLocalizations.of(context)!
                                    .monthlyCommission,
                                myController: _monthlyCommissionController,
                                typeField: TextInputType.number,
                                validation: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .monthlyCommissionRateError;
                                  }
                                  return null;
                                },
                                hintText: AppLocalizations.of(context)!
                                    .monthlyCommissionPricePlaceholder,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                            ],
                          )
                        : const SizedBox(),
                    CheckboxListTile(
                      title: Text(
                          '${AppLocalizations.of(context)!.activateRate}:'),
                      contentPadding: const EdgeInsets.only(left: 10.0),
                      enableFeedback: true,
                      tileColor: Colors.transparent,
                      value: _isActive,
                      onChanged: (value) {
                        setState(() {
                          _isActive = !_isActive;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Rate rate = Rate(
                              id: notificationId,
                              rateTitle: _titleRateController.text,
                              transactionCommission: double.parse(
                                  _transactionCommissionController.text),
                              isMonthlyCommission: _isMonthlyCommission,
                              monthlyCommission: _isMonthlyCommission
                                  ? int.parse(_monthlyCommissionController.text)
                                  : 0,
                              isActive: _isActive,
                            );
                            context.read<RatesCubit>().addRate(rate);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const HomePage(selectedTab: 1);
                              }),
                            );
                          }
                        },
                        child:
                            Text(AppLocalizations.of(context)!.addRateTitleBtn),
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
