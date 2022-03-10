class Consumable<T1, T2> {
  final T1? positive;
  final T2 negative;

  Consumable(this.positive, this.negative);

  factory Consumable.AutoNegative(T2 value) => Consumable(null, value);
}
