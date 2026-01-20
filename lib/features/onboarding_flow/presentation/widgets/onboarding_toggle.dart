import 'package:flutter/material.dart';

class OnBoardingToggle extends StatelessWidget {
  final void Function(bool isClient) onSelect;
  const OnBoardingToggle({required this.onSelect, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onSelect(true),
              child: Center(child: Text("Client")),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onSelect(false),
              child: Center(child: Text("Inspector")),
            ),
          ),
        ],
      ),
    );
  }
}
