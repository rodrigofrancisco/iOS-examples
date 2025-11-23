//
//  HTTPClient.swift
//  EssentialFeedCaseStudy
//
//  Created by RODRIGO FRANCISCO PABLO on 09/11/24.
//

public enum HTTPClientResult {
    case sucess(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
