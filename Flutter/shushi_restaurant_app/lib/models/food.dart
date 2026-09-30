class Food {
  String name;
  String price;
  String imagePath;
  String rating;

  Food({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating
  });

  get _name => name;
  get _price => price;
  get _imagePath => imagePath;
  get _rating => rating;
}