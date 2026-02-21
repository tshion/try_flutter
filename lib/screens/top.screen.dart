import 'package:flutter/material.dart';
import 'package:try_flutter/bridges/trykmp.g.dart';

/// トップ画面
class TopScreen extends StatefulWidget {
  const TopScreen({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  String _text = 'Loading...';
  final _trykmp = TryKmpHostApi();

  @override
  void initState() {
    super.initState();
    _trykmp
        .searchGitHubRepo("flutter")
        .then(
          (value) => setState(() {
            _text = value.items.map((GitHubRepoItem item) => item.fullName).join("\n");
          }),
        )
        .catchError((error) => setState(() {
              _text = error.toString();
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Text(_text),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTimer(context),
        tooltip: 'Show current time',
        child: const Icon(Icons.timer),
      ),
    );
  }

  void _showTimer(BuildContext context) async {
    final time = await _trykmp.time();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(time)));
    }
  }
}
