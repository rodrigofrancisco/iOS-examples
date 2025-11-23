//
//  RemoteFeedLoader.swift
//  EssentialFeedCaseStudy
//
//  Created by RODRIGO FRANCISCO PABLO on 06/11/24.
//

public final class RemoteFeedLoader: FeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    public typealias Result = LoadFeedResult
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { [weak self] result  in
            guard self != nil else { return }
            switch result {
            case let .sucess(data, response):
                completion(FeedItemsMapper.map(data, from: response))
            case .failure:
                completion(.failure(RemoteFeedLoader.Error.connectivity))
            }
        }
    }
}
