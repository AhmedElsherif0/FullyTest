import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:integration_test/integration_test_driver.dart';

Future<void> main() {
  return integrationDriver(
    responseDataCallback: (data) async {
      if (data != null) {
        final timeline = driver.Timeline.fromJson(
            data['scrolling_summary'] as Map<String, dynamic>);

        await driver.TimelineSummary.summarize(timeline).writeTimelineToFile(
            'scrolling_summary',
            pretty: true,
            includeSummary: true);
      }
    },
  );
}
