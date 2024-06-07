class Boss {

  String name;
  String descripiton;
  int numberOfRune;
  String location;
  String imagePath;

  Boss({
    required this.name,
    required this.descripiton,
    required this.numberOfRune,
    required this.location,
    required this.imagePath
  });

  String getImage() => 'images/$imagePath';
}