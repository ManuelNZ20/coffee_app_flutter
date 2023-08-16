import 'package:coffee_app_flutter/presentation/providers/coffee_provider.dart';
import 'package:coffee_app_flutter/presentation/providers/toggle_color_button_bar.dart';
import 'package:coffee_app_flutter/presentation/widgets/coffee/button_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RowTabs extends StatefulWidget {
  const RowTabs({
    super.key,
  });
  @override
  State<RowTabs> createState() => _RowTabsState();
}

class _RowTabsState extends State<RowTabs> with SingleTickerProviderStateMixin {
  final toggleButton = ToggleButtonTabBar();

  @override
  void initState() {
    toggleButton.init(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final coffee = context.watch<CoffeeProvider>();
    return SizedBox(
      height: 60,
      child: TabBar(
        indicatorWeight: .1,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        controller: toggleButton.tabController,
        isScrollable: true,
        tabs: toggleButton.tabs
            .asMap()
            .map((index, e) => MapEntry(
                  index,
                  ButtonTab(
                    text: e.categoryName,
                    selected: e.selected,
                    onPressed: () {
                      coffee.addCoffeeDataByCategory(e.categoryName);
                      toggleButton.onCategorySelected(index);
                      toggleButton.tabController.animateTo(index,curve: Curves.linear,duration: const Duration(milliseconds: 300));
                    },
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}
