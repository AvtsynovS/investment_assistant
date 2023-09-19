import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_assistant/src/feature/deals/domain/models/deal_model.dart';

import 'package:investment_assistant/src/feature/history/presentation/state/history_screen_cubit.dart';

import 'package:investment_assistant/src/feature/history/presentation/screens/close_deal_screen.dart';
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

        if (closeDealsCount == 0 && _searchController.text == '') {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              child: Text(
                AppLocalizations.of(context)!.historyEmptyText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
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
              searchFunction: closeDealsCubit.searchCloseDeals,
              hintText: AppLocalizations.of(context)!.searchHistoryPlaceholder,
            ),
            leadingWidth: 200,
            actions: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(style: BorderStyle.none)),
                onPressed: () {},
                // onPressed: () => Navigator.pushNamed(context, '/addDeal'),
                // TODO добавить виджет фильтрации по имени и периоду
                child: const Text('фильтр'),
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
