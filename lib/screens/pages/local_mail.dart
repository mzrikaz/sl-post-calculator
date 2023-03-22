import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sl_post_air_mail_calculator/providers/country_provider.dart';
import 'package:sl_post_air_mail_calculator/widgets/postage_tile.dart';

class LocalMail extends StatelessWidget {
  const LocalMail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CountryProvider>(builder: (context, provider, ch) {
      return ListView(
        children: [
          PostageTile(
            name: "Letter",
            price: provider.localMail['letter'],
            maxWeight: 2,
            registered:
                "Registered ${provider.localMail['letter'] + (provider.localMail['letter'] != 0 ? 60 : 0)} LKR",
          ),
          PostageTile(
            name: "SL Post Courier",
            price: provider.localMail['courier'],
            maxWeight: 40,
          ),
          PostageTile(
            name: "Parcel",
            price: provider.localMail['parcel'],
            maxWeight: 20,
          ),
          PostageTile(
            name: "On State Service",
            price: 60,
            maxWeight: 40,
          ),
          PostageTile(
            name: "Open Article",
            price: 60,
            maxWeight: 40,
          ),
          PostageTile(
            name: "NewsPaper",
            price: 60,
            maxWeight: 40,
          ),
          PostageTile(
            name: "Basket & Bag",
            price: 60,
            maxWeight: 40,
          ),
        ],
      );
    });
  }
}
