import 'dart:async';

import 'package:flutter/material.dart';
import 'package:try_flutter/designs/loading.overlay.dart';
import 'package:try_flutter/screens/top.screen.dart';

/// 起動画面
class LauncherScreen extends StatefulWidget {
  const LauncherScreen({super.key});

  @override
  State<LauncherScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const TopScreen(title: 'Flutter Demo Home Page'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0xFFFFFFFF),
          constraints: BoxConstraints.expand(),
        ),
        Center(child: const Text("Launcher")),
        LoadingOverlay(),
      ],
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
