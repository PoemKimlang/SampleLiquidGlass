//
//  ViewController.swift
//  SampleLiquidGlass
//
//  Created by Poem Kimlang on 10/18/25.
//

import UIKit

// MARK: - Main Home Screen (Apple Music–style)
class ViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private let viewModel = HomeVM()
    
    // MARK: - Life Cycle-
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGlassNavigationBar()
        setupBackgroundGlass()
        setupCollectionView()
        viewModel.initData()
    }
}

// MARK: - Glass Background
extension ViewController {
    
    private func setupBackgroundGlass() {
        // Background blur for glass-like aesthetic
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurView)
        
        // Gradient overlay for depth
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor.white.withAlphaComponent(0.15).cgColor,
            UIColor.systemBackground.withAlphaComponent(0.6).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        
        let gradientView = UIView(frame: view.bounds)
        gradientView.layer.addSublayer(gradient)
        gradientView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.contentView.addSubview(gradientView)
    }
}

// MARK: - Navigation Bar
extension ViewController {
    
    private func setupGlassNavigationBar() {
        guard let navBar = navigationController?.navigationBar else { return }
        
        // Transparent navigation bar
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
        navBar.backgroundColor = .clear
        
        // Left title label ("Listen Now")
        let titleLabel = UILabel()
        titleLabel.text = "Listen Now"
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.textColor = .label
        titleLabel.textAlignment = .center
        titleLabel.isUserInteractionEnabled = true
        
        // Add tap gesture for label (optional)
        let tap = UITapGestureRecognizer(target: self, action: #selector(titleTapped))
        titleLabel.addGestureRecognizer(tap)
        
        // Wrap in container to control padding
        let container = UIView()
        container.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 180)
        ])
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: container)
        
        // Right profile image
        let profileImageView = UIImageView(image: UIImage(named: "me") ?? UIImage(systemName: "person.crop.circle.fill"))
        profileImageView.tintColor = .systemPink
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 17
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderWidth = 0.5
        profileImageView.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.widthAnchor.constraint(equalToConstant: 34).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        // Tap gesture on profile
        let profileTap = UITapGestureRecognizer(target: self, action: #selector(profileTapped))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(profileTap)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
    
    @objc private func profileTapped() {
        print("👤 Profile tapped!")
    }
    
    @objc private func titleTapped() {
        print("🎵 Title tapped!")
    }
}

// MARK: - Collection View Setup
extension ViewController {
    
    private func setupCollectionView() {
        let layout = createLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        
        // Register cells
        collectionView.register(UINib(nibName: "SectionCell", bundle: nil),
                                forCellWithReuseIdentifier: "SectionCell")
        collectionView.register(UINib(nibName: "MusicCell", bundle: nil),
                                forCellWithReuseIdentifier: "MusicCell")
        view.addSubview(collectionView)
    }
}

// MARK: - Compositional Layout
extension ViewController {
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let sectionType = self.viewModel.sections[sectionIndex]
            
            switch sectionType {
            case .title:
                // Section header
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(50))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: itemSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16)
                return section
                
            case .content:
                // Horizontal music carousel
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45),
                                                      heightDimension: .estimated(190))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 6)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(UIScreen.main.bounds.width - 32),
                                                       heightDimension: .estimated(200))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 15, trailing: 16)
                return section
            }
        }
    }
}

// MARK: - CollectionView DataSource
extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch viewModel.sections[section] {
        case .title: return 1
        case .content(let items): return items.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch viewModel.sections[indexPath.section] {
        case .title(let title):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCell", for: indexPath) as! SectionCell
            cell.titleLabel.text = title
            cell.arrowImage.image = UIImage(systemName: "chevron.right")
            cell.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.3)
            cell.layer.cornerRadius = 12
            return cell
            
        case .content(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCell", for: indexPath) as! MusicCell
            let item = items[indexPath.item]
            cell.configCell(data: item)
            cell.backgroundColor = UIColor.white.withAlphaComponent(0.15)
            cell.layer.cornerRadius = 12
            cell.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
            cell.layer.borderWidth = 0.5
            return cell
        }
    }
}
