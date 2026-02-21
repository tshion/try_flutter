import TryKMP

internal class TryKmpHost: TryKmpHostApi {
    private let model = TryKmp()


    func time() throws -> String {
        return model.time(suffix: "")
    }

    func searchGitHubRepo(query: String, completion: @escaping (Result<String, any Error>) -> Void) {
        model.searchGitHubRepo(query: query) { result, error in
            if let result = result {
                completion(.success("\(result)"))
            }
            completion(.failure(error ?? PigeonError(code: "", message: nil, details: nil)))
        }
    }
}
