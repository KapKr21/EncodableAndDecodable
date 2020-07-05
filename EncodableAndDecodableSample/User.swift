//
//  User.swift
//  EncodableAndDecodableSample
//
//  Created by Kap's on 30/06/20.
//  Copyright © 2020 Kapil. All rights reserved.
//

import Foundation

struct Data : Decodable {
    
    let error     : Bool
    let bod       : [Data]
    let message   : String
}

struct Metadata : Decodable  {
    
    let post_type : String
    let post_file : String
}
