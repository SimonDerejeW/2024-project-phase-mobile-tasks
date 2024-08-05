class Product{
  String _name;
  double _price;
  String _description;

  Product(this._name , this._price, this._description);

  String get productName => _name;
  double get productPrice => _price;
  String get productDescription => _description;

  set productName(String newName){
    _name = newName;
  }
  set productPrice(double newPrice){
    if (newPrice >= 0) {
      _price = newPrice;
    } else{
      print("Price can't be negative!");
    }
  }
  set productDescription(String newDescription){
    _description = newDescription;
  }

}