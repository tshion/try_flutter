import 'package:flutter/material.dart';
import 'package:try_flutter/designs/scrim.overlay.dart';

/// ローディング表示
class LoadingOverlay extends Stack {
  const LoadingOverlay({super.key})
    : super(
        alignment: AlignmentDirectional.center,
        children: const [ScrimOverlay(), CircularProgressIndicator()],
      );
}
