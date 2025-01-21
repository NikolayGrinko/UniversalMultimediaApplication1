//
//  UIView.swift
//  UniversalMultimediaApplication1
//
//  Created by Николай Гринько on 20.01.2025.
//

import UIKit

extension UIView {
    func applyGradient(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = self.bounds
        gradientLayer.masksToBounds = true
        
        // Удаляем старые слои градиента, если они есть
        self.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer })
        
        // Добавляем новый слой градиента
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addShadow() {
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath.init(rect: bounds).cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 10, height: 10)
        layer.shouldRasterize = true
    }
    
}

// MARK: - Расширение UIColor для пользовательских цветов
extension UIColor {
    static let customBlue = #colorLiteral(red: 0.2824099586, green: 0.2401617251, blue: 0.5460324755, alpha: 1)
    static let customGreen = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    
}





