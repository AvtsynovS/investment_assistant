import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_assistant/src/feature/deals/presentation/state/deals_screen_cubit.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:investment_assistant/src/helpers/date_helpers.dart';
import 'package:investment_assistant/src/ui/widgets/search_text_field.dart';

import '../widgets/deal.dart';

class DealsScreen extends StatefulWidget {
  const DealsScreen({
    super.key,
  });

  @override
  State<DealsScreen> createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsScreen> {
  final _searchController = TextEditingController();

  List<String> selectedDays = [];

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: (DateTime.now()),
  );

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (newDateRange == null) return;

    setState(() {
      selectedDays = DateHelpers.getDaysInBetween(
        newDateRange.start,
        newDateRange.end,
      );
      dateRange = newDateRange;
    });
  }

  @override
  void initState() {
    context.read<DealsCubit>().initDeals();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealsCubit, DealsCubitState>(
      builder: (context, state) {
        final dealsCubit = context.read<DealsCubit>();
        final dealsCount = dealsCubit.initState().deals.length;
        final initialDeals = dealsCubit.initState().deals;

        if (dealsCount == 0 && _searchController.text == '') {
          return SizedBox(
            child: OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, '/addDeal'),
              child: Text(AppLocalizations.of(context)!.firstDealTitleBtn),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            leading: SearchTextField(
              searchController: _searchController,
              searchFunction: dealsCubit.searchDeals,
              hintText: AppLocalizations.of(context)!.searchDealPlaceholder,
            ),
            leadingWidth: 200,
            actions: [
              IconButton(
                onPressed: () => Navigator.pushNamed(context, '/addDeal'),
                icon: const Icon(Icons.add_circle_outline),
              ),
              IconButton(
                padding: const EdgeInsets.only(right: 15),
                onPressed: () async {
                  await pickDateRange();
                  dealsCubit.filterForDateRange(selectedDays);
                },
                icon: const Icon(Icons.filter_list),
              ),
            ],
          ),
          body: (dealsCount != 0)
              ? Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ListView.builder(
                    itemCount: dealsCount,
                    itemBuilder: (context, index) {
                      final deal = initialDeals[index];
                      return DealScreen(
                        deal: deal,
                      );
                    },
                  ),
                )
              : Center(
                  child: SizedBox(
                    child: Text(AppLocalizations.of(context)!.emptySearchDeal),
                  ),
                ),
        );
      },
    );
  }
}
