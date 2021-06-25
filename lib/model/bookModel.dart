class BookModel {
  int id;
  String image;
  String name;
  String author;
  String status;
  String location;
  int ownerId;
  String ownerName;
  BookModel({
    required this.id,
    required this.image,
    required this.name,
    required this.author,
    required this.status,
    required this.location,
    required this.ownerId,
    required this.ownerName,
  });
}
