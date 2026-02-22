import 'package:pigeon/pigeon.dart';

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
  GitHubRepoDto searchGitHubRepo(String query);
}

class GitHubRepoDto {
  const GitHubRepoDto({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  final int totalCount;
  final bool incompleteResults;
  final List<GitHubRepoItemDto> items;
}

class GitHubRepoItemDto {
  const GitHubRepoItemDto({
    required this.fullName,
    this.description,
    required this.url,
    required this.updatedAt,
    this.language,
  });

  final String fullName;
  final String? description;
  final String url;
  final String updatedAt;
  final String? language;
}
