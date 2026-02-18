package com.example.try_flutter

import androidx.lifecycle.lifecycleScope
import com.example.try_flutter.bridge.TryKmpHost
import com.example.try_flutter.bridge.TryKmpHostApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        TryKmpHostApi.setUp(
            flutterEngine.dartExecutor.binaryMessenger,
            TryKmpHost(lifecycleScope),
        )
    }
}
