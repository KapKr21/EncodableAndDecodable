//
//  PostData.swift
//  EncodableAndDecodableSample
//
//  Created by Kap's on 30/06/20.
//  Copyright © 2020 Kapil. All rights reserved.
//

import Foundation

struct PostData : Encodable, Decodable {
    
    let user_lat : String
    let user_lng : String
    let my_id    : Int
    let filter   : String
}
