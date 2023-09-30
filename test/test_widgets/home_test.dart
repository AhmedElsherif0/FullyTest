import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/logic/favorite_provider.dart';
import 'package:testing_app/presentation/home_screen.dart';

Widget createHomeScreen() => ChangeNotifierProvider<FavoriteProvider>(
      create: (context) => FavoriteProvider(),
      child: const MaterialApp(home: HomePage()),
    );

void main() {
  testWidgets('Testing if ListView shows up', (tester) async {
    await tester.pumpWidget(createHomeScreen());
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Testing IconButtons', (tester) async {
    await tester.pumpWidget(createHomeScreen());
    expect(find.byIcon(Icons.favorite), findsNothing);
    await tester.tap(find.byIcon(Icons.favorite_border).first);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('Added to favorites.'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsWidgets);
    await tester.tap(find.byIcon(Icons.favorite).first);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('Removed from favorites.'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsNothing);
  });

  group('Home Page Widget Tests', () {
    testWidgets('Testing Scrolling', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Item 0'), findsOneWidget);
      await tester.fling(find.byType(ListView), const Offset(0, -200), 3000);
      await tester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
    });
  });
}
