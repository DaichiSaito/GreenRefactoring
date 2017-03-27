//
//  GitHubRequest.swift
//  GitHubSearchRepository
//
//  Created by DaichiSaito on 2017/03/15.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import Foundation
import NCMB

enum OrderEnum {
    case byDescending
    case byAscending
}
struct Order {
    var orderKind: OrderEnum
    var value: String
    
    
}
protocol NiftyRequest {
//    associatedtype Response: NCMBObject // ResponseというのがSearchResponseとして特殊化されるっぽい
    var className: String { get }
//    var baseURL: URL { get }
//    var path: String { get }
//    var method: HTTPMethod { get }
    var parameters: Any? { get }
    var includeKey: String? { get }
    var limit: Int32 { get }
    var order: Order { get }
    
//    var responses: [NCMBObject]? { get set }
}

extension NiftyRequest {
//    var baseURL: URL {
//        return URL(string: "http://dsh4k2h4k2.esy.es/Green/image")!
//    }
    
    var limit: Int32 {
        return 100
    }
    
    func buildQuery() -> NCMBQuery {
        let query = NCMBQuery(className: className)
        if let dictionary = parameters as? [String : Any] {
            for (key, value) in dictionary {
                query?.whereKey(key, equalTo: value)
            }
        }
        
        
        
        query?.includeKey = includeKey
        
        query?.limit = limit
        
        switch order.orderKind {
        case .byDescending:
            query?.order(byDescending: order.value)
        case .byAscending:
            query?.order(byAscending: order.value)
        }
        
        return query!
        
    }
    
    
//    func buildURLRequest() -> URLRequest {
//        let url = baseURL.appendingPathComponent(path)
//        var components = URLComponents(url:url,resolvingAgainstBaseURL: true)
//        
//        switch method {
//        case  .get:
//            let dictionary = parameters as? [String : Any]
//            let queryItems = dictionary?.map { key, value in
//                return URLQueryItem(name: key, value: String(describing: value))
//            }
//            components?.queryItems = queryItems
//        default:
//            fatalError("Unsupported method \(method)")
//        }
//        
//        var urlRequest = URLRequest(url: url)
//        urlRequest.url = components?.url
//        urlRequest.httpMethod = method.rawValue
//        
//        return urlRequest
//    }
    
    
//    func response(from data:[NCMBObject]) {
//        responses = data
//    }
//    func response(from data: Data, urlResponse:URLResponse) throws -> Response {
//        let json = try JSONSerialization.jsonObject(with: data, options: [])
//        if case(200..<300)? = (urlResponse as? HTTPURLResponse)?.statusCode {
//            return try Response(json:json)
//        } else {
//            throw try GitHubAPIError(json:json)
//        }
//        
//        
//    }
}
