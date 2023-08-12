import 'package:coffee_app_flutter/presentation/widgets/coffee/button_tab.dart';
import 'package:flutter/material.dart';

class RowButtonsTabs extends StatelessWidget {
  const RowButtonsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ButtonTab(text: 'Esspresso')
      ],
    );
  }
}