import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_assistant/src/feature/rates/presentation/state/rates_screen_cubit.dart';

import '../../../../ui/screens/home_page.dart';
import '../../../../ui/widgets/my_form_field.dart';
import '../../domain/models/rate_model.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateRate extends StatefulWidget {
  const UpdateRate({required this.rate, super.key});

  final Rate rate;

  @override
  State<UpdateRate> createState() => _UpdateRateState();
}

class _UpdateRateState extends State<UpdateRate> {
  _UpdateRateState();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleRateController = TextEditingController();
  final _monthlyCommissionController = TextEditingController();
  final _transactionCommissionController = TextEditingController();
  bool _isMonthlyCommission = false;
  bool _isActive = false;

  @override
  void initState() {
    super.initState();
    _titleRateController.text = widget.rate.rateTitle;
    if (widget.rate.monthlyCommission != 0) {
      _monthlyCommissionController.text =
          (widget.rate.monthlyCommission.toString());
    }
    _transactionCommissionController.text =
        widget.rate.transactionCommission.toString();
    _isMonthlyCommission = widget.rate.isMonthlyCommission ?? false;
    _isActive = widget.rate.isActive;
  }

  @override
  void dispose() {
    _titleRateController.dispose();
    _transactionCommissionController.dispose();
    _monthlyCommissionController.dispose();
    super.dispose();
  }

  // TODO Доработать верстку, шрифты в теме и т.п.
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
                        fieldTitle: AppLocalizations.of(context)!.titleDeal,
                        myController: _titleRateController,
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
                        if (value == null || !value) {
                          setState(() {
                            _monthlyCommissionController.text = '0';
                          });
                        }
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Rate rate = Rate(
                              id: widget.rate.id,
                              rateTitle: _titleRateController.text,
                              transactionCommission: double.parse(
                                  _transactionCommissionController.text),
                              isMonthlyCommission: _isMonthlyCommission,
                              monthlyCommission: _isMonthlyCommission
                                  ? int.parse(_monthlyCommissionController.text)
                                  : 0,
                              isActive: _isActive,
                            );
                            context.read<RatesCubit>().updateRate(rate);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const HomePage(selectedTab: 1);
                              }),
                            );
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
