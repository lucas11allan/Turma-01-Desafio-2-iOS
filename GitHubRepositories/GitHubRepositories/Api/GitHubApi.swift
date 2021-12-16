//
//  GitHubApi.swift
//  GitHubRepositories
//
//  Created by LUCAS ALLAN ALMEIDA OLIVEIRA on 15/12/21.
//

import Foundation
import Alamofire

class GitHubApi {
    func fetchRepositories(completion: @escaping (Repositories) -> ()) {
        let params = QueryParam(q: "language:Swift", sort: "Stars")
        let paramEncoder = URLEncodedFormParameterEncoder(encoder: URLEncodedFormEncoder(keyEncoding: .convertToSnakeCase))
        let bodyEncoder = JSONDecoder()
        bodyEncoder.dateDecodingStrategy = .iso8601
        AF.request("https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1",
                   parameters: params,
                   encoder: paramEncoder
        ) { urlRequest in
            ///            alterar linha abaixo adicionando seu token do github
//            urlRequest.addValue("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", forHTTPHeaderField: "Authorization")
        }
        .validate(statusCode: 200..<300)
        .responseDecodable(of: Repositories.self, decoder: bodyEncoder) { response in
            guard let repositories = response.value else { return }
            completion(repositories)
        }
    }
    
    func fetchBranches(repository: String, completion: @escaping ([Branch]) -> ()) {
        let bodyEncoder = JSONDecoder()
        bodyEncoder.dateDecodingStrategy = .iso8601
        let url = "https://api.github.com/repos/" + repository + "/branches"
        AF.request(url) { urlRequest in
            ///            alterar linha abaixo adicionando seu token do github
//            urlRequest.addValue("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", forHTTPHeaderField: "Authorization")
        }
        .validate(statusCode: 200..<300)
        .responseDecodable(of: [Branch].self, decoder: bodyEncoder) { response in
            guard let branchs = response.value else { return }
            completion(branchs)
        }
    }
}


struct QueryParam: Encodable {
    let q: String
    let sort: String
    let page: Int
    let perPage: Int
    init(q: String, sort: String, page: Int, perPage: Int) {
        self.q = q
        self.sort = sort
        self.page = page
        self.perPage = perPage
    }
    init(q: String, sort: String) {
        self.q = q
        self.sort = sort
        self.page = 1
        self.perPage = 2
    }
}
