import 'package:flutter/material.dart';

/// 半透明の黒いオーバーレイ表示
class ScrimOverlay extends ModalBarrier {
  const ScrimOverlay({super.key}) : super(color: const Color(0x51000000));
}
