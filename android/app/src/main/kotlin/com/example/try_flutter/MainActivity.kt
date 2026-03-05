package com.example.try_flutter

import androidx.lifecycle.lifecycleScope
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // TryKmpHostApi.setUp(
        //     flutterEngine.dartExecutor.binaryMessenger,
        //     TryKmpHost(lifecycleScope),
        // )
    }
}
