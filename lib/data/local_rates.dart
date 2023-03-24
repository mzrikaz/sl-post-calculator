int getLocalLetterRate(int weight) {
  Map<String, dynamic> localRates = {
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

int getLocalCourierRate(int weight) {
  Map<String, dynamic> localRates = {
    "max": 40000,
    "base_weight": 250,
    "base_rate": 200,
  };
  int price = 0;

  if (weight <= 250 && weight > 0) {
    price = localRates["base_rate"];
  } else if (weight > localRates["base_weight"] && weight <= 500) {
    price = 250;
  } else if (weight > 500 && weight <= 1000) {
    price = 350;
  } else if (weight > 1000 && weight <= 10000) {
    price = 350;
    int additionalWeight = int.parse("${weight - 1000}");
    price += (additionalWeight / 1000).ceil() * 50;
  } else if (weight > 10000 && weight <= 15000) {
    price = 850;
  } else if (weight > 15000 && weight <= 20000) {
    price = 1100;
  } else if (weight > 20000 && weight <= 40000) {
    price = 1100; // Add base rate for this price range to 130
    int additionalWeight = int.parse("${weight - 20000}");
    // Here 50 is how much difference of grams between every price
    // 20 means how much rupee per 50 gram
    price += (additionalWeight / 5000).ceil() * 500;
  }

  return price;
}

int getLocalParcelRate(int weight) {
  Map<String, dynamic> localRates = {
    "max": 20000,
    "base_weight": 250,
    "base_rate": 150,
  };
  int price = 0;

  if (weight <= 250 && weight > 0) {
    price = localRates["base_rate"];
  } else if (weight > localRates["base_weight"] && weight <= 500) {
    price = 200;
  } else if (weight > 500 && weight <= 1000) {
    price = 250;
  } else if (weight > 1000 && weight <= 10000) {
    price = 250;
    int additionalWeight = int.parse("${weight - 1000}");
    price += (additionalWeight / 1000).ceil() * 50;
  } else if (weight > 10000 && weight <= 20000) {
    price = 700; // Add base rate for this price range to 130
    int additionalWeight = int.parse("${weight - 10000}");
    // Here 50 is how much difference of grams between every price
    // 20 means how much rupee per 50 gram
    price += (additionalWeight / 5000).ceil() * 100;
  }

  return price;
}

int getLocalNewspaperRate(int weight) {
  Map<String, dynamic> localRates = {
    "max": 1000,
    "base_weight": 60,
    "base_rate": 20,
  };
  int price = 0;

  if (weight <= 60 && weight > 0) {
    price = localRates["base_rate"];
  } else if (weight > localRates["base_weight"] && weight <= 120) {
    price = 30;
  } else if (weight > 120 && weight <= 960) {
    price = 30; // Add base rate for this price range to 130
    int additionalWeight = int.parse("${weight - 120}");
    // Here 50 is how much difference of grams between every price
    // 20 means how much rupee per 50 gram
    price += (additionalWeight / 120).ceil() * 10;
  } else if (weight > 960 && weight <= localRates["max"]) {
    price = 110; // Add base rate for this price range to 520
  }

  return price;
}

int getLocalOpenArticleRate(int weight) {
  Map<String, dynamic> localRates = {
    "max": 2000,
    "base_weight": 30,
    "base_rate": 30,
  };
  int price = 0;

  if (weight <= 30 && weight > 0) {
    price = localRates["base_rate"];
  } else if (weight > localRates["base_weight"] && weight <= 960) {
    price = 30; // Add base rate for this price range to 130
    int additionalWeight = int.parse("${weight - localRates["base_weight"]}");
    // Here 50 is how much difference of grams between every price
    // 20 means how much rupee per 50 gram
    price += (additionalWeight / 30).ceil() * 5;
  } else if (weight > 960 && weight <= 1000) {
    price = 250; // Add base rate for this price range to 520
  } else if (weight > 1000 && weight <= localRates["max"]) {
    price = 250; // Add base rate for this price range to 130
    int additionalWeight = int.parse("${weight - 1000}");
    // Here 50 is how much difference of grams between every price
    // 20 means how much rupee per 50 gram
    price += (additionalWeight / 500).ceil() * 50;
  }

  return price;
}

int getLocalOnStateRate(int weight) {
  Map<String, dynamic> localRates = {
    "max": 5000,
    "base_weight": 20,
    "base_rate": 110,
  };
  int price = 0;

  if (weight <= 20 && weight > 0) {
    price = localRates["base_rate"];
  } else if (weight > localRates["base_weight"] && weight <= 100) {
    price = localRates["base_rate"];
    ; // Add base rate for this price range to 130
    int additionalWeight = int.parse("${weight - localRates["base_weight"]}");
    // Here 50 is how much difference of grams between every price
    // 20 means how much rupee per 50 gram
    price += (additionalWeight / 10).ceil() * 10;
  } else if (weight > 100 && weight <= 1000) {
    price = 190; // Add base rate for this price range to 520
    int additionalWeight = int.parse("${weight - 100}");
    price += (additionalWeight / 50).ceil() * 20;
  } else if (weight > 1000 && weight <= 2000) {
    price = 550; // Add base rate for this price range to 130
    int additionalWeight = int.parse("${weight - 1000}");
    // Here 50 is how much difference of grams between every price
    // 20 means how much rupee per 50 gram
    price += (additionalWeight / 250).ceil() * 30;
  } else if (weight > 2000 && weight <= localRates["max"]) {
    price = 670; // Add base rate for this price range to 130
    int additionalWeight = int.parse("${weight - 2000}");
    // Here 50 is how much difference of grams between every price
    // 20 means how much rupee per 50 gram
    price += (additionalWeight / 1000).ceil() * 50;
  }

  return price;
}

int getLocalBasketRate(int weight) {
  Map<String, dynamic> localRates = {
    "max": 20000,
    "base_weight": 10000,
    "base_rate": 300,
  };
  int price = 0;

  if (weight <= 10000 && weight > 0) {
    price = localRates["base_rate"];
  } else if (weight > localRates["base_rate"] && weight <= localRates["max"]) {
    price = 300; // Add base rate for this price range to 130
    int additionalWeight = int.parse("${weight - localRates["base_weight"]}");
    // Here 50 is how much difference of grams between every price
    // 20 means how much rupee per 50 gram
    price += (additionalWeight / 1000).ceil() * 50;
  }

  return price;
}
