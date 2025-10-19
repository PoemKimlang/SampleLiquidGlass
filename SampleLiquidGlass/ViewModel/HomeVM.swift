//
//  HomeVM.swift
//  SampleLiquidGlass
//
//  Created by Poem Kimlang on 10/18/25.
//

import Foundation

class HomeVM {
    
    var sections: [HomeSectionType] = []
    
    func initData() {
        // Section 1: Title + Content
        sections.append(.title("Recently Played"))
        sections.append(.content([
            HomeModel.Content(image: "pj-section3", title: "Dear Father - Single", subtitle: "ម៉ម ពេជ្ជរិទ្ធ"),
            HomeModel.Content(image: "vanda", title: "Stay With Me - Single", subtitle: "Mann VannDa"),
            HomeModel.Content(image: "piseth", title: "LOVE EFFECT - Single", subtitle: "Tep Piseth"),
            HomeModel.Content(image: "pj-section1", title: "Missing You", subtitle: "KmengKhmer"),
            HomeModel.Content(image: "pj-section1", title: "Dreaming", subtitle: "Adda")
        ]))
        
        // Section 2: Title + Content
        sections.append(.title("Top Hits"))
        sections.append(.content([
            HomeModel.Content(image: "tena", title: "បងក្រ", subtitle: "Tena Feat. YCN Rakhie"),
            HomeModel.Content(image: "pj-section1", title: "Only You", subtitle: "Oun Dollah"),
            HomeModel.Content(image: "pj-section2", title: "Rainy Mood", subtitle: "Ton Chanseyma"),
            HomeModel.Content(image: "piseth", title: "Happy Ending", subtitle: "Sokun Nisa"),
            HomeModel.Content(image: "pj-section2", title: "Shine Bright", subtitle: "VannDa")
        ]))
        
        // Section 3: Title + Content
        sections.append(.title("New Releases"))
        sections.append(.content([
            HomeModel.Content(image: "pj-section3", title: "Never Again", subtitle: "Khemarak Sereymon"),
            HomeModel.Content(image: "piseth", title: "Love Taste - Single", subtitle: "Tep Piseth"),
            HomeModel.Content(image: "pj-section3", title: "Only Tonight", subtitle: "Laura Mam"),
            HomeModel.Content(image: "vanda", title: "One More Day", subtitle: "G-Devith"),
            HomeModel.Content(image: "pj-section3", title: "Without You", subtitle: "Oun Dollah")
        ]))
    }
}
