import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';

import 'package:investment_assistant/src/feature/history/presentation/state/history_screen_cubit.dart';

import 'package:investment_assistant/src/feature/history/presentation/screens/close_deal_screen.dart';
import 'package:investment_assistant/src/helpers/date_helpers.dart';
import 'package:investment_assistant/src/themes/theme.dart';
import 'package:investment_assistant/src/ui/widgets/search_text_field.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    super.key,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
    context.read<HistoryCubit>().initHistory();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryCubitState>(
      builder: (context, state) {
        final closeDealsCubit = context.read<HistoryCubit>();
        final closeDealsCount = closeDealsCubit.initState().closeDeals.length;
        final initialCloseDeals = closeDealsCubit.initState().closeDeals;

        return Scaffold(
          // TODO Настроить тему для AppBar
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(255, 57, 56, 56),
            leading: SearchTextField(
              searchController: _searchController,
              searchFunction: closeDealsCubit.searchCloseDeals,
              hintText: AppLocalizations.of(context)!.searchHistoryPlaceholder,
            ),
            leadingWidth: 200,
            actions: [
              IconButton(
                padding: const EdgeInsets.only(right: 15),
                onPressed: () async {
                  await pickDateRange();
                  closeDealsCubit.filterForDateRange(selectedDays);
                },
                icon: const Icon(Icons.filter_list,
                    color: DarkThemeColors.primaryDarkColor),
              ),
            ],
          ),
          body: (closeDealsCount != 0)
              ? Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ListView.builder(
                    itemCount: closeDealsCount,
                    itemBuilder: (context, index) {
                      Deal closeDeal = initialCloseDeals[index];
                      return CloseDealScreen(
                        closeDeal: closeDeal,
                      );
                    },
                  ),
                )
              : Center(
                  child: SizedBox(
                    child:
                        Text(AppLocalizations.of(context)!.emptySearchHistory),
                  ),
                ),
        );
      },
    );
  }
}
