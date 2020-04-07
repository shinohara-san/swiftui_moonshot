//
//  Mission.swift
//  Moonshot
//
//  Created by Yuki Shinohara on 2020/04/03.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
//     a nested struct
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
//    let launchDate: String?
//    Dateformatterで色々処理するのでデータがdate型になった
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var crewMember:String{
        "篠原ゆうき"
        
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }

}
