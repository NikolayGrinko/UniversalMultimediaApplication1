//
//  CellsMemTB_1.swift
//  UniversalMultimediaApplication1
//
//  Created by Николай Гринько on 22.01.2025.
//

import UIKit

class CellsMemTB_1: UICollectionViewCell {
    
    private var titles: [Meme] = [Meme]()
    
    static let identifier = "CellsMemTB_1"
    
    let id = Int()
    let baxCount = Int()
    
    let imageViewCell: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray6
        return imageView
    }()
    
    let textDescrLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .white
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.font = .systemFont(ofSize: 16, weight: .regular)
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageViewCell)
        contentView.addSubview(textDescrLabel)
        
        setupConstraints() 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func  configure(with titles: [Meme]) {
        self.titles = titles
        self.textDescrLabel.text = titles[id].name
        self.imageViewCell.image = UIImage(named: "\(titles[id].url)")
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            imageViewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageViewCell.bottomAnchor.constraint(equalTo: textDescrLabel.topAnchor, constant: -5),
            
            textDescrLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textDescrLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textDescrLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.25),
            textDescrLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])
        
    }
}

