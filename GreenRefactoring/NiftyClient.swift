//
//  NiftyClient.swift
//  GreenRefactoring
//
//  Created by DaichiSaito on 2017/03/17.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import Foundation

import NCMB

class NiftyClient {
    
    func loadImageData(
        request: NiftyRequest,
        completion: @escaping (Result<[NCMBObject],NiftyClientError>) -> Void) {
        
        let query = request.buildQuery()
        query.findObjectsInBackground { (object, error) in
            
            switch(object,error) {
            case(_,let error?):
                completion(Result(error: .connectionError(error)))
                
            case(let object?, _):
                completion(Result(value: object as! [NCMBObject]))
                
            default:
                fatalError("invalid response combination \(object),\(error).")
                
            }
        }
    }
    
}
