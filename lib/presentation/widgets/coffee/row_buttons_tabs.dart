import 'package:coffee_app_flutter/presentation/providers/coffee_provider.dart';
import 'package:coffee_app_flutter/presentation/shared/data/coffee_data.dart';
import 'package:coffee_app_flutter/presentation/widgets/coffee/button_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RowTabs extends StatefulWidget {
  const RowTabs({super.key});

  @override
  State<RowTabs> createState() => _RowTabsState();
}

class _RowTabsState extends State<RowTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController =
        TabController(length: categoriesCoffee.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final coffee = context.watch<CoffeeProvider>();
    return SizedBox(
        height: 60,
        child: TabBar(
            indicatorWeight: 0.1,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            controller: _tabController,
            isScrollable: true,
            tabs: List.generate(
                categoriesCoffee.length,
                (index) => ButtonTab(
                    text: categoriesCoffee[index],
                    onPressed: () {
                      coffee.addCoffeeDataByCategory(categoriesCoffee[index]);
                    }))));
  }
}
