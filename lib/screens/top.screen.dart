import 'package:flutter/material.dart';
import 'package:try_flutter/designs/loading.overlay.dart';
import 'package:try_flutter_plugin/try_flutter_plugin.dart';

/// トップ画面
class TopScreen extends StatefulWidget {
  const TopScreen({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  bool _isLoading = true;
  List<GitHubRepoItemDto> _list = [];
  final _trykmp = TryKmpPlugin();

  @override
  void initState() {
    super.initState();
    _trykmp
        .searchGitHubRepo("flutter")
        .then(
          (value) => setState(() {
            _list = value.items;
          }),
        )
        .catchError((error) {
          debugPrint(error.toString());
          if (mounted) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(error.toString()),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        })
        .whenComplete(
          () => setState(() {
            _isLoading = false;
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
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) =>
                ListTile(title: Text(_list[index].fullName)),
          ),
          if (_isLoading) ...{const LoadingOverlay()},
        ],
      ),
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
