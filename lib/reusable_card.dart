import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
    this.colour,
    this.cardChild,
  );

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: cardChild,
    );
  }
}
