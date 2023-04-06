class Corner {
  final double value;

  Corner({this.value = 0.0});

  or(num other) {
    return value == 0.0 ? other : value;
  }

  toDouble() {
    return value;
  }

  @override
  toString() {
    return value.toString();
  }

  toInt() {
    return value.toInt();
  }

  operator +(num other) {
    return value + other;
  }

  operator -(num other) {
    return value - other;
  }

  operator *(num other) {
    return value * other;
  }

  operator /(num other) {
    return value / other;
  }

  operator %(num other) {
    return value % other;
  }

  operator ~/(num other) {
    return value ~/ other;
  }

  operator <(num other) {
    return value < other;
  }

  operator <=(num other) {
    return value <= other;
  }

  operator >(num other) {
    return value > other;
  }

  operator >=(num other) {
    return value >= other;
  }

  @override
  bool operator ==(dynamic other) => value.hashCode == other.hashCode;

  @override
  int get hashCode => value.hashCode;

  operator -() {
    return -value;
  }
}
