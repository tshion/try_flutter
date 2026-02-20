import 'package:flutter/material.dart';

/// 半透明の黒いオーバーレイ表示
class ScrimOverlay extends StatelessWidget {
  const ScrimOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0x51000000),
      constraints: BoxConstraints.expand(),
    );
  }
}
