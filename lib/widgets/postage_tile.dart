import 'package:flutter/material.dart';

class PostageTile extends StatelessWidget {
  const PostageTile({
    required this.name,
    required this.subtitle,
    required this.price,
    this.registered = "",
    required this.maxWeight,
  });
  final String name, subtitle, registered;
  final int maxWeight;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "${registered.isNotEmpty ? '$registered |' : ''} *Max ${maxWeight}Kg",
          style: TextStyle(fontSize: 11),
        ),
        trailing: Text(
          "${price.toStringAsFixed(2)} LKR",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
