class Stock {
  final String name;
  final int quantity;
  final int units;
  final double rate;
  final String store;

  Stock({
    required this.name,
    required this.quantity,
    required this.units,
    required this.rate,
    required this.store,
  });

  double get totalPrice => quantity * rate;
}