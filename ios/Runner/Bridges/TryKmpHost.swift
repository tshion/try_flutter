import TryKMP

internal class TryKmpHost: TryKmpHostApi {
    private let model = TryKmp()
    
       
    func searchGitHubRepo(query: String, completion: @escaping (Result<GitHubRepoDto, any Error>) -> Void) {
        model.searchGitHubRepo(query: query) { result, error in
            if let result = result {
                let mapped = GitHubRepoDto(
                    totalCount: Int64(result.totalCount),
                    incompleteResults: result.incompleteResults,
                    items: result.items.map {
                        GitHubRepoItemDto(
                            fullName: $0.fullName,
                            description: $0.description,
                            url: $0.url,
                            updatedAt: $0.updatedAt.ISO8601Format(),
                            language: $0.language
                        )
                    }
                )
                completion(.success(mapped))
            }
            completion(.failure(error ?? PigeonError(code: "", message: nil, details: nil)))
        }
    }
    
    func time() throws -> String {
        return model.time(suffix: "")
    }
}
