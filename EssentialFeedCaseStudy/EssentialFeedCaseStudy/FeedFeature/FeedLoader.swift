//
//  FeedLoader.swift
//  EssentialFeedCaseStudy
//
//  Created by RODRIGO FRANCISCO PABLO on 05/11/24.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
