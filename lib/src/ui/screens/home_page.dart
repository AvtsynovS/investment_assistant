import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_assistant/src/feature/deals/presentation/screen/deals_screen.dart';
import 'package:investment_assistant/src/feature/deals/presentation/state/deals_screen_cubit.dart';
import 'package:investment_assistant/src/feature/rates/presentation/screens/rates_screen.dart';
import 'package:investment_assistant/src/feature/rates/presentation/state/rates_screen_cubit.dart';
import 'package:investment_assistant/src/feature/settings/presentation/screen/settings.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.selectedTab, Key? key}) : super(key: key);

  final int selectedTab;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedTab = 0;

  @override
  void initState() {
    context.read<RatesCubit>().initRates();
    context.read<DealsCubit>().initDeals();
    super.initState();
  _selectedTab = widget.selectedTab;
  }

  final List _pages = [
    Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 10.0),
      child: const DealsScreen(),
    ),
    Container(
      alignment: Alignment.center,
      child: const RatesScreen(),
    ),
    Container(
      alignment: Alignment.center,
      child: const Text('History page widget'),
    ),
    Container(
      alignment: Alignment.center,
      child: const Settings(),
    ),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(AppLocalizations.of(context)!.mainTitle),
      ),
      body: _pages[_selectedTab],
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          selectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.auto_graph),
                label: AppLocalizations.of(context)!.dealsTitle),
            BottomNavigationBarItem(
                icon: const Icon(Icons.radar_outlined),
                label: AppLocalizations.of(context)!.ratesTitle),
            BottomNavigationBarItem(
                icon: const Icon(Icons.work_history_outlined),
                label: AppLocalizations.of(context)!.historyTitle),
            BottomNavigationBarItem(
                icon: const Icon(Icons.bookmark),
                label: AppLocalizations.of(context)!.settingsTitle),
          ],
        ),
      ),
    );
  }
}
