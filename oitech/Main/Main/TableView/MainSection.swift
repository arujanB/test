//
//  MainSection.swift
//  oitech
//
//  Created by Aruzhan Boranbay on 18.10.2024.
//

import Foundation

struct MainSection {
    enum MainPageSection {
        case detail
        case main
        
        var title: String {
            switch self {
            case .detail:
                return "Section"
            case .main:
                return "Section"
            }
        }
    }
    
    enum MainRowType {
        case detail(title: String)
        case main(mainTitle: String)
    }
    
    let type: MainPageSection
    var rows: [MainRowType]
}
