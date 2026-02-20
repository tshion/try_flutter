import 'dart:async';

import 'package:flutter/material.dart';
import 'package:try_flutter/molecules/loading.overlay.dart';
import 'package:try_flutter/pages/top.page.dart';

/// 起動画面
class LauncherPage extends StatefulWidget {
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TopPage(title: 'Flutter Demo Home Page'),
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
