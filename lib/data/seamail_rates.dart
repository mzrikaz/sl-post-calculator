Map<String, dynamic> seaMailRates = {
  // The weight array and rates array indexes linked each other
  // first index of the weight represents the base rate.
  // Subsequent weights are calculate like this i.e: 21-50, 51-100
  "letters": {
    "rates": [130, 240, 440, 1020, 1980, 3920, 7780],
    "weight": [20, 50, 100, 250, 500, 1000, 2000]
  },
  "printed": {
    "rates": [120, 230, 410, 970, 1900, 3760, 7480],
    "weight": [20, 50, 100, 250, 500, 1000, 2000],
  },
  "small_packets": {
    "rates": [440, 1000, 1930, 3790],
    "weight": [100, 250, 500, 1000],
  },
  // Allowed countries for seamail
  "allowed": {
    "Australia",
    "Austria",
    "Belarus",
    "Canada",
    "China",
    "Czech Rep",
    "Denmark",
    "Finland",
    "France",
    "Germany",
    "Great Britain",
    "Greece",
    "Hong Kong",
    "Iceland",
    "India",
    "Ireland",
    "Israel",
    "Italy",
    "Japan",
    "Korea South",
    "Malasyia",
    "Maldives",
    "Myanmar",
    "Netherlands",
    "New Zealand",
    "Norway",
    "Philippines",
    "Poland",
    "Russian Federation",
    "Singapore",
    "South Africa",
    "Spain",
    "Sweden",
    "Switzerland",
    "Thailand",
    "UAE",
    "Ukraine",
    "USA",
  },
};
