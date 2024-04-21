class Actor {
  final int id;
  final int name;
  final int profilePath;
  final String? character;

  Actor(
      {required this.id,
      required this.name,
      required this.profilePath,
      this.character});
}
