import 'package:flutter/material.dart';
import 'package:try_flutter/designs/scrim.overlay.dart';

/// ローディング表示
class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScrimOverlay(),
        Center(child: const CircularProgressIndicator()),
      ],
    );
  }
}
