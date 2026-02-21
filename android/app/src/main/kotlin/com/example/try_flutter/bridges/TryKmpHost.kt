package com.example.try_flutter.bridges

import io.github.tshion.trykmp.TryKmp
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.launch

internal class TryKmpHost(
    private val scope: CoroutineScope,
) : TryKmpHostApi {

    private val model = TryKmp()


    override fun time(): String {
        return model.time()
    }

    override fun searchGitHubRepo(
        query: String,
        callback: (Result<String>) -> Unit
    ) {
        scope.launch {
            try {
                val result = model.searchGitHubRepo(query)
                callback(Result.success(result.toString()))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }
}
