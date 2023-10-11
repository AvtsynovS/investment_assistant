import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:investment_assistant/src/feature/rates/presentation/state/rates_screen_cubit.dart';
import 'package:investment_assistant/src/themes/theme.dart';
import 'package:investment_assistant/src/ui/widgets/search_text_field.dart';

import 'rate_screen.dart';

class RatesScreen extends StatefulWidget {
  const RatesScreen({
    super.key,
  });

  @override
  State<RatesScreen> createState() => _RatesScreenState();
}

class _RatesScreenState extends State<RatesScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    context.read<RatesCubit>().initRates();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatesCubit, RatesCubitState>(
      builder: (context, state) {
        final ratesCubit = context.read<RatesCubit>();
        final ratesCount = ratesCubit.initState().rates.length;
        final initialRates = ratesCubit.initState().rates;

        if (ratesCount == 0 && _searchController.text == '') {
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
            backgroundColor: const Color.fromARGB(255, 57, 56, 56),
            leading: SearchTextField(
              searchController: _searchController,
              searchFunction: ratesCubit.searchRates,
              hintText: AppLocalizations.of(context)!.searchRatePlaceholder,
            ),
            leadingWidth: 200,
            actions: [
              IconButton(
                padding: const EdgeInsets.only(right: 15),
                onPressed: () => Navigator.pushNamed(context, '/addRate'),
                icon: const Icon(Icons.add_circle_outline,
                    color: DarkThemeColors.primaryDarkColor),
              ),
            ],
          ),
          body: (ratesCount != 0)
              ? Padding(
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
                )
              : Center(
                  child: SizedBox(
                    child: Text(AppLocalizations.of(context)!.emptySearchRate),
                  ),
                ),
        );
      },
    );
  }
}
