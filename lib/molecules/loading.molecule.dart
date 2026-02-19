import 'package:flutter/material.dart';

/// ローディング表示
class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0x66000000),
          constraints: BoxConstraints.expand(),
        ),
        Center(child: const CircularProgressIndicator()),
      ],
    );
  }
}
