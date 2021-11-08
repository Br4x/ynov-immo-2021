class CheckBoxState {
  final String titre;
  final int id;
  bool value;

  CheckBoxState({
    this.id,
    this.titre,
    this.value = false,
  });

  get getTitre => this.titre;

  get getValue => this.value;

  set setValue(value) => this.value = value;

  @override
  String toString() {
    return 'CheckBoxState{title: $titre, value: $value}';
  }
}
