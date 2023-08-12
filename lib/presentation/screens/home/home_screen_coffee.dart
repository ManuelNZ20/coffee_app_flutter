import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
    late TabController _tabController;
    @override
  void initState() {
    // TODO: implement initState
    _tabController  = TabController(length: 10, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50), child: _AppBarHomeScreen()),
      body: SafeArea(
        child: ContainerPadding(
          child: Column(
            children: [
              const TextSearchCoffee(),
              _TextTabView(
                titleTabs: 'Categories',
                onTap: () {},
              ),
              Container(
                height: 60,
                child: TabBar(
                  indicatorWeight: 0.1,
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  controller:_tabController,
                  isScrollable: true,
                  tabs: List.generate(10, (index) => ButtonTab(text: '$index')))
                )
            ],
          ),
        ),
      ),
    );
  }
}

class _TextTabView extends StatelessWidget {
  final String titleTabs;
  final VoidCallback onTap;
  const _TextTabView({required this.titleTabs, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(titleTabs,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),
        ),
        ButtonAllTabs(onTap: onTap)
      ],
    );
  }
}

class _AppBarHomeScreen extends StatelessWidget {
  const _AppBarHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded)),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Coffee'),
          Text('Take'),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(MaterialCommunityIcons.shopping))
      ],
    );
  }
}
