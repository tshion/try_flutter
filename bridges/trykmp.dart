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
  String searchGitHubRepo(String query);
}
