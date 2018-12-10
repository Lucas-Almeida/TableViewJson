//
//  JsonModel.swift
//  Exercício Foundation JSON
//
//  Created by Lucas Pinheiro Almeida on 10/12/2018.
//  Copyright © 2018 Lucas Pinheiro Almeida. All rights reserved.
//

import Foundation

struct JsonModel: Decodable {
    var id: String
    var text: String
    var create_date: String
    var update_date: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case text = "text"
        case create_date = "created_at"
        case update_date = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        text = try values.decode(String.self, forKey: .text)
        create_date = try values.decode(String.self, forKey: .create_date)
        update_date = try values.decode(String.self, forKey: .update_date)
    }
}
