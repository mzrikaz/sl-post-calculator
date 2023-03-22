import 'package:flutter/material.dart';
import 'package:sl_post_air_mail_calculator/widgets/postage_tile.dart';

class LocalMail extends StatelessWidget {
  const LocalMail({
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
          name: "SL Post Courier",
          subtitle: "Registered 110.00",
          price: 60,
          maxWeight: 40,
        ),
        PostageTile(
          name: "Parcel",
          subtitle: "Registered 110.00",
          price: 60,
          maxWeight: 40,
        ),
        PostageTile(
          name: "On State Service",
          subtitle: "Registered 110.00",
          price: 60,
          maxWeight: 40,
        ),
        PostageTile(
          name: "Open Article",
          subtitle: "Registered 110.00",
          price: 60,
          maxWeight: 40,
        ),
        PostageTile(
          name: "NewsPaper",
          subtitle: "Registered 110.00",
          price: 60,
          maxWeight: 40,
        ),
        PostageTile(
          name: "Basket & Bag",
          subtitle: "Registered 110.00",
          price: 60,
          maxWeight: 40,
        ),
      ],
    );
  }
}
