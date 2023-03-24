import 'package:quiz_123200047/data/groceries.dart';

class Favorite {
  final Groceries? groceries;
  final bool? isFavorite;

  Favorite({this.groceries, this.isFavorite});

  var favoriteList = <Favorite>[];
}
