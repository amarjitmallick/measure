class AreaConversion {
  static const double kathaToSquareFeet = 720.0;
  static const double acreToBigha = 2.5;
  static const double shotokToKatha = 0.5;
  static const double bighaToShotok = 40.0;
  static const double kathaToChhotak = 16.0;
  static const double shotangshoToChhotak = 9.68;
  static const double shotangshoToKatha = 0.605;
  static const double shotangshoToShotok = 1.0;

  double squareFeet = 0;

  AreaConversion({required this.squareFeet});

  factory AreaConversion.fromSquareFeet(double squareFeet) {
    return AreaConversion(squareFeet: squareFeet);
  }

  double get toKatha => squareFeet / kathaToSquareFeet;
  double get toAcre => (squareFeet / kathaToSquareFeet) / (acreToBigha * bighaToShotok * shotokToKatha);
  double get toBigha => (squareFeet / kathaToSquareFeet) / bighaToShotok;
  double get toShotok => (squareFeet / kathaToSquareFeet) * (1 / shotokToKatha);
  double get toChhotak => (squareFeet / kathaToSquareFeet) * kathaToChhotak;
  double get toShotangsho => (squareFeet / kathaToSquareFeet) * shotangshoToKatha;

  void updateFromSquareFeet(double value) {
    squareFeet = value;
  }

  void updateFromKatha(double value) {
    squareFeet = value * kathaToSquareFeet;
  }

  void updateFromAcre(double value) {
    squareFeet = value * acreToBigha * bighaToShotok * shotokToKatha * kathaToSquareFeet;
  }

  void updateFromBigha(double value) {
    squareFeet = value * bighaToShotok * shotokToKatha * kathaToSquareFeet;
  }

  void updateFromShotok(double value) {
    squareFeet = value * shotokToKatha * kathaToSquareFeet;
  }

  void updateFromChhotak(double value) {
    squareFeet = value * (1 / kathaToChhotak) * kathaToSquareFeet;
  }

  void updateFromShotangsho(double value) {
    squareFeet = value * (1 / shotangshoToKatha) * kathaToSquareFeet;
  }
}
