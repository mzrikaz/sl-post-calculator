import 'package:flutter/material.dart';

class PostageTile extends StatelessWidget {
  const PostageTile({
    required this.name,
    required this.price,
    this.registered = "",
    required this.maxWeight,
  });
  final String name, registered;
  final int maxWeight;
  final int price;

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
          "$price LKR",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
