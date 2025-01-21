//
//  HomeViewController.swift
//  UniversalMultimediaApplication1
//
//  Created by Николай Гринько on 21.01.2025.
//

import UIKit


class HomeVC_One: UIViewController {
    
    var collectionView: UICollectionView! = nil
    
    let buttonLeft: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.frame = CGRect(x: 10, y: 50, width: 40, height: 35)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        view.addSubview(buttonLeft)
        ApiReq_1TB.shared.downloadGet()
        view.backgroundColor = #colorLiteral(red: 0.5458797216, green: 0.1337981224, blue: 0.4389412999, alpha: 1)
        if let tabBar = self.tabBarController?.tabBar {
            // Убираем фон
            let appearance = UITabBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = .clear // Прозрачный фон
            appearance.shadowColor = .clear    // Убираем нижнюю границу
            
            // Применяем стиль к TabBar
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    

    
    @objc private func didTapButton() {
        let vc = HomeViewController()
        
        // Оборачиваем его в UINavigationController
//        let navigationController = UINavigationController(rootViewController: vc)
//        navigationController.modalPresentationStyle = .fullScreen // Для полноэкранного отображения
//        present(navigationController, animated: true, completion: nil)
        vc.modalPresentationStyle = .custom
        present(vc, animated: true)
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height), collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = #colorLiteral(red: 0.5458797216, green: 0.1337981224, blue: 0.4389412999, alpha: 1)
        view.addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Setup Layout
    
    private func createLayout() -> UICollectionViewLayout {
        // section -> groups -> items -> size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        let spacing = CGFloat(20)
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: spacing, bottom: 0, trailing: spacing)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension HomeVC_One: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .green
        cell.layer.borderWidth = 1
        return cell
    }
}



