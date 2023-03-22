import 'package:flutter/material.dart';
import 'package:sl_post_air_mail_calculator/widgets/postage_tile.dart';

class AirMail extends StatelessWidget {
  const AirMail({
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
          name: "U Packet",
          subtitle: "Registered 110.00",
          price: 60,
          maxWeight: 40,
        ),
        PostageTile(
          name: "EMS",
          subtitle: "Registered 110.00",
          price: 60,
          maxWeight: 40,
        ),
        PostageTile(
          name: "Printed Matters",
          subtitle: "Registered 110.00",
          price: 60,
          maxWeight: 40,
        ),
        PostageTile(
          name: "Parcels",
          subtitle: "Registered 110.00",
          price: 60,
          maxWeight: 40,
        ),
      ],
    );
  }
}
