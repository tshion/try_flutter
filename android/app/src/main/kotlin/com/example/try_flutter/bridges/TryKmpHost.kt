package com.example.try_flutter.bridges

import io.github.tshion.trykmp.TryKmp
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

internal class TryKmpHost(
    private val scope: CoroutineScope,
) : TryKmpHostApi {

    private val model = TryKmp()


    override fun time(): String {
        return model.time()
    }

    override fun searchGitHubRepo(
        query: String,
        callback: (Result<GitHubRepoDto>) -> Unit
    ) {
        scope.launch {
            withContext(Dispatchers.Default) {
                try {
                    val result = model.searchGitHubRepo(query)
                    result.let { native ->
                        GitHubRepoDto(
                            native.totalCount.toLong(),
                            native.incompleteResults,
                            native.items.map {
                                GitHubRepoItemDto(
                                    it.fullName,
                                    it.description,
                                    it.url,
                                    it.updatedAt.toString(),
                                    it.language,
                                )
                            },
                        )
                    }.also { callback(Result.success(it)) }
                } catch (e: Exception) {
                    callback(Result.failure(e))
                }
            }
        }
    }
}
