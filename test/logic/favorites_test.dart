import 'package:test/test.dart';
import 'package:testing_app/logic/favorite_provider.dart';

void main() {
  group('Testing App Provider', () {
    var favorites = FavoriteProvider();

    test('A new item should be added', () {
      var number = 35;
      favorites.add(number);
      expect(favorites.favoriteItems.contains(number), true);
    });

    test('An item should be removed', () {
      var number = 45;
      favorites.add(number);
      expect(favorites.favoriteItems.contains(number), true);
      favorites.remove(number);
      expect(favorites.favoriteItems.contains(number), false);
    });
  });
}
