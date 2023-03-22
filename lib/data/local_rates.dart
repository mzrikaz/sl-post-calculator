int getLocalRate(int weight) {
  Map<String, dynamic> localRates = {
    "name": "Letter",
    "registered": 60,
    "max": 2000,
    "base_weight": 20,
    "base_rate": 50,
  };
  int price = 0;

  if (weight <= 20 && weight > 0) {
    price = localRates["base_rate"];
  } else if (weight > localRates["base_weight"] && weight <= 100) {
    price = localRates["base_rate"];
    int additionalWeight = int.parse("${weight - localRates["base_weight"]}");
    price += (additionalWeight / 10).ceil() * 10;
  } else if (weight > 100 && weight <= 1000) {
    price += 130; // Add base rate for this price range to 130
    int additionalWeight = int.parse("${weight - 100}");
    // Here 50 is how much difference of grams between every price
    // 20 means how much rupee per 50 gram
    price += (additionalWeight / 50).ceil() * 20;
  } else if (weight > 1000 && weight <= 2000) {
    price += 490; // Add base rate for this price range to 520
    int additionalWeight = int.parse("${weight - 1000}");
    price += (additionalWeight / 250).ceil() * 30;
  }

  return price;
}
