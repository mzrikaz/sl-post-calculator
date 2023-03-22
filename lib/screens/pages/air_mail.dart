import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sl_post_air_mail_calculator/providers/country_provider.dart';
import 'package:sl_post_air_mail_calculator/widgets/postage_tile.dart';

class AirMail extends StatelessWidget {
  const AirMail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CountryProvider>(builder: (context, provider, ch) {
      return ListView(
        children: [
          PostageTile(
            name: "Letter",
            price: provider.airMail['letter'],
            maxWeight: 2,
            registered: "Registered 0.00",
          ),
          PostageTile(
            name: "U Packet",
            price: provider.airMail['u_packets'],
            maxWeight: 40,
          ),
          PostageTile(
            name: "EMS",
            price: 60,
            maxWeight: 40,
          ),
          PostageTile(
            name: "Printed Matters",
            price: provider.airMail['printed'],
            maxWeight: 40,
          ),
          PostageTile(
            name: "Parcels",
            price: 60,
            maxWeight: 40,
          ),
        ],
      );
    });
  }
}
