import 'package:flutter/material.dart';
import 'package:sputnik/constants/colors.dart';

class RootLayout extends StatelessWidget {
  const RootLayout({super.key, required this.child, this.stack, this.appBar});

  final Widget child;
  final Widget? stack;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: MColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: child,
            ),
            if (stack != null) stack!,
          ],
        ),
      ),
    );
  }
}
