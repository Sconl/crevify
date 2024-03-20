import 'package:flutter/material.dart';
import 'package:shape_clipper/s_clipper.dart'; // Import SClipper
import 'package:crevify/shared/theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height; // Adjustable height for the AppBar
  final String title; // Text to display in the center
  final List<Widget> leadingWidgets; // List of widgets for the left side
  final List<Widget> trailingWidgets; // List of widgets for the right side
  final CustomClipper<Path>? customClipper; // Custom shape from 'shape_clipper' package
  final double bottomPadding; // Adjustable padding to move the app bar down
  final double topPadding; // Added this line for top padding

  const CustomAppBar({
    Key? key,
    required this.height,
    this.title = "",
    this.leadingWidgets = const [],
    this.trailingWidgets = const [],
    this.customClipper,
    this.bottomPadding = 0.0,
    this.topPadding = 5.0,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height + bottomPadding); // Adjust total height

  @override
  Widget build(BuildContext context) {
    final clipper = customClipper ?? SClipper(); // Use SClipper as the default
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + topPadding,
        left: MediaQuery.of(context).padding.left,
        right: MediaQuery.of(context).padding.right,
      ),
      child: Stack(
        children: [
          ClipPath(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            clipper: clipper,
            child: Container(
              color: Theme.of(context).primaryColor,
              height: height,
              child: Padding(
                // Add top padding here:
                padding: EdgeInsets.only(top: 0, left: screenWidth * 0.02, right: screenWidth * 0.02, bottom: screenWidth * 0.09),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Leading widgets
                          Row(
                            children: leadingWidgets.isNotEmpty ? leadingWidgets : [Container()],
                          ),
                          // Centered title
                          Expanded(
                            child: Center(child: Text(title, style: Theme.of(context).textTheme.headline6)),
                          ),
                          // Trailing widgets
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end, // Align trailing widgets to the right
                            children: trailingWidgets.isNotEmpty ? trailingWidgets : [Container()],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
