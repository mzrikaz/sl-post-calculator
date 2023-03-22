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
          subtitle: "Registered 110.00 | *Max 2Kg",
          price: 60,
          maxWeight: 2,
          registered: "Registered 0.00",
        ),
        PostageTile(
          name: "Printed",
          subtitle: "Registered 110.00",
          price: 60,
          maxWeight: 40,
        ),
        PostageTile(
          name: "Small Packet",
          subtitle: "Registered 110.00",
          price: 60,
          maxWeight: 40,
        ),
      ],
    );
  }
}
