class Singletone {
  void Function() update;
  static Singletone _instanse;

  factory Singletone() {
    if (Singletone._instanse == null) {
      Singletone._instanse = Singletone._();
    }
    return Singletone._instanse;
  }

  Singletone._();
}
