import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/bridge/trykmp.g.dart',
    dartPackageName: 'trykmp',
    kotlinOptions: KotlinOptions(package: 'com.example.try_flutter.bridge'),
    kotlinOut:
        'android/app/src/main/kotlin/com/example/try_flutter/bridge/TryKmp.g.kt',
    swiftOut: 'ios/Runner/Bridge/TryKmp.g.swift',
  ),
)
@HostApi()
abstract class TryKmpHostApi {
  String time();

  @async
  String searchGitHubRepo(String query);
}
