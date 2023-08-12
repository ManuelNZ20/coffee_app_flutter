import 'package:flutter/material.dart';

class TextSearchCoffee extends StatelessWidget {
  const TextSearchCoffee({super.key});

  @override
  Widget build(BuildContext context) {
    final underlineInputBorder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade100));
    final inputDecoration = InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: 'Search',
        hintStyle: TextStyle(
          color:Colors.grey.shade400
        ),
        enabledBorder: underlineInputBorder,
        focusedBorder: underlineInputBorder,
        suffixIcon: 
          _IconFormField(
            onPressed: (){},
            iconData: Icons.keyboard_voice_rounded,
          ),  
        prefixIcon: _IconFormField(onPressed: (){}, iconData: Icons.search)
        );

    return TextFormField(
      decoration: inputDecoration,
    );
  }
}

class _IconFormField extends StatelessWidget {

  final VoidCallback onPressed;
  final IconData iconData;
  const _IconFormField({
    super.key,
    required this.onPressed,
    required this.iconData
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){},
      icon: Icon(
        iconData,
        color: Colors.grey.shade500,
          ),
    );
  }
}
