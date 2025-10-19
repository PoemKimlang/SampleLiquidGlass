//
//  GlassTabBarController.swift
//  SampleLiquidGlass
//
//  Created by Poem Kimlang on 10/18/25.
//

import UIKit

// MARK: - Main Glass Tab Bar Controller
class GlassTabBarController: UITabBarController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarAppearance()
        setupViewControllers()
    }
}

// MARK: - Setup Tabs
extension GlassTabBarController {
    
    private func setupViewControllers() {
        
        let home     = createTab(title: "Listen Now", icon: "play.circle", selected: "play.circle.fill")
        let browse   = createTab(title: "Browse", icon: "square.grid.2x2", selected: "square.grid.2x2.fill")
        let radio    = createTab(title: "Radio", icon: "dot.radiowaves.left.and.right", selected: "dot.radiowaves.left.and.right")
        let library  = createTab(title: "Library", icon: "music.note.list", selected: "music.note.list")
        let search   = createTab(title: "Search", icon: "magnifyingglass", selected: "magnifyingglass")
        
        viewControllers = [home, browse, radio, library, search]
    }
    
    /// Helper for creating navigation-based tabs
    private func createTab(title: String, icon: String, selected: String) -> UINavigationController {
        let vc = UINavigationController(rootViewController: ViewController())
        vc.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: icon),
            selectedImage: UIImage(systemName: selected)
        )
        return vc
    }
}

// MARK: - Appearance
extension GlassTabBarController {
    
    /// Configures the tab bar with glass-like blur and animations
    private func setupTabBarAppearance() {
        // Transparent style
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.isTranslucent = true
        
        // Tint colors (Apple Music style)
        tabBar.tintColor = .systemPink
        tabBar.unselectedItemTintColor = UIColor.label.withAlphaComponent(0.6)
        
        // Typography customization
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.systemPink,
            .font: UIFont.systemFont(ofSize: 11, weight: .semibold)
        ]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.label.withAlphaComponent(0.6),
            .font: UIFont.systemFont(ofSize: 11, weight: .regular)
        ]
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        
    }
}
