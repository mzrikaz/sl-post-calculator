import 'package:flutter/material.dart';
import 'package:sl_post_air_mail_calculator/widgets/postage_tile.dart';

class SeaMail extends StatelessWidget {
  const SeaMail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PostageTile(
          name: "Letter",
          price: 60,
          maxWeight: 2,
          registered: "Registered 0.00",
        ),
        PostageTile(
          name: "Printed",
          price: 60,
          maxWeight: 40,
        ),
        PostageTile(
          name: "Small Packet",
          price: 60,
          maxWeight: 40,
        ),
      ],
    );
  }
}
