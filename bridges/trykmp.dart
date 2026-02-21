import 'package:pigeon/pigeon.dart';

// import 'entities/github_repo.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/bridges/trykmp.g.dart',
    dartPackageName: 'trykmp',
    kotlinOptions: KotlinOptions(package: 'com.example.try_flutter.bridges'),
    kotlinOut:
        'android/app/src/main/kotlin/com/example/try_flutter/bridges/TryKmp.g.kt',
    swiftOut: 'ios/Runner/Bridges/TryKmp.g.swift',
  ),
)
@HostApi()
abstract class TryKmpHostApi {
  String time();

  @async
  GitHubRepo searchGitHubRepo(String query);
}

class GitHubRepo {
  GitHubRepo({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  int totalCount;
  bool incompleteResults;
  List<GitHubRepoItem> items;
}

class GitHubRepoItem {
  GitHubRepoItem({
    required this.fullName,
    this.description,
    required this.url,
    required this.updatedAt,
    this.language,
  });

  String fullName;
  String? description;
  String url;
  String updatedAt;
  String? language;
}
