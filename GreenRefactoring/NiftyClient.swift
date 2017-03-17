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
    
    func loadImageData(request: NiftyRequest) {
        
        let query = request.buildQuery()
        query.findObjectsInBackground { (object, error) in
            
        }
    }
    
}
