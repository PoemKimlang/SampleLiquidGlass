//
//  HomeModel.swift
//  SampleLiquidGlass
//
//  Created by Poem Kimlang on 10/18/25.
//

import Foundation

enum HomeSectionType {
    case title(String)                  // e.g. “Recently Played”
    case content([HomeModel.Content])   // e.g. array of songs/albums
}

struct HomeModel {
    struct Content {
        let image   : String?
        let title   : String?
        let subtitle: String?
    }
}
