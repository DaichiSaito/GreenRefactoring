//
//  NiftyAPI.swift
//  GreenRefactoring
//
//  Created by DaichiSaito on 2017/03/17.
//  Copyright © 2017年 DaichiSaito. All rights reserved.
//

import Foundation
import NCMB
final class NiftyAPI {
    
    struct SearchWearImage: NiftyRequest {
//        typealias  Response = SearchResponse<NCMBObject>
        
        var className: String {
            return "WEARIMAGE"
        }
        
        var parameters: Any? {
            return nil
        }
        
        var includeKey: String? {
            return nil
        }
        
        var order: Order {
            return Order(orderKind: .byDescending, value: "createDate")
        }
    }
    
    
}
