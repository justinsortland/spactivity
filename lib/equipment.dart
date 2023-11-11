class Equipment {
  final String id;
  final String name;
  final String imageURL;
  final List<String> availableAtGyms; // List of gym IDs
  final bool isMachine;
  final List<String> instructions;
  final List<String> pushPull;
  final List<String> legsBackChest;

  Equipment({
    required this.id, 
    required this.name, 
    required this.imageURL,
    required this.availableAtGyms,
    required this.isMachine,
    required this.instructions,
    required this.pushPull,
    required this.legsBackChest,
  });
}