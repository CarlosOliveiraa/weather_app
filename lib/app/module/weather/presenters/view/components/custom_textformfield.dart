import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final void Function()? onTap;
  final void Function(String)? onChanged;

  const CustomTextField({Key? key, this.onTap, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
