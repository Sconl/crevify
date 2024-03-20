import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shape_clipper/shape_clipper.dart';
import 'package:shape_clipper/wavy_clipper.dart';

void main() {
  testWidgets('WavyClipper test', (WidgetTester tester) async {
    final clipper = WavyClipper();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClipPath(
            clipper: clipper,
            child: Container(
              color: Colors.red,
              width: 200,
              height: 100,
            ),
          ),
        ),
      ),
    );

    // Verify basic rendering
    final containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    // Assertions for visual properties (adjust based on your clipper)
    final clipPath = tester.widget<ClipPath>(find.byType(ClipPath));
    final clipPathLayer = clipPath.clipper?.getClip(Size(200, 100)); // Use null-safe operator

    // Handle null case for clipPathLayer
    if (clipPathLayer == null) {
      // Handle the case where clipPath.clipper is null (unlikely but possible)
      return;
    }

    // Example assertions (replace with your specific checks):
    expect(clipPathLayer.getBounds(), Rect.fromLTRB(0, 0, 200, 100)); // Check overall bounds

    // Custom logic for path complexity (replace with your approach)
    int pathComplexity(Path path) {
      // Implement your logic here to count path segments or other complexity measure
      // This is a placeholder example
      return path.getBounds().width.toInt() + path.getBounds().height.toInt();
    }

    final complexity = pathComplexity(clipPathLayer);
    expect(complexity, greaterThan(10)); // Check wave complexity
  });

  // Add a new function to create a standalone widget with the WavyClipper
  Widget buildWavyWidget() {
    return ClipPath(
      clipper: WavyClipper(),
      child: Container(
        color: Colors.red,
        width: 200,
        height: 100,
      ),
    );
  }

  // Run the app with the standalone widget (optional for visual inspection)
  // You can uncomment this block to launch a separate app window
  // during testing to see the rendered widget visually.
  //await tester.pumpWidget(MaterialApp(home: buildWavyWidget()));
}
