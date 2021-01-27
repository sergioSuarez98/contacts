//
//  underlined.swift
//  Contactos
//
//  Created by alumnos on 27/01/2021.
//  Copyright © 2021 alumnos. All rights reserved.
//

import UIKit

class underlined: UITextField {
    
  private let underline = CALayer()
        
        private func setupUnderline() {
        // Borramos los bordes que tienen los UITextField por defecto.
        borderStyle = .none
            /*let colore : UIColor = UIColor.init(displayP3Red: 229, green: 116, blue: 57, alpha: 0.9)*/
        
        // Borramos los horrorosos bordes que tienen los UITextField por defecto.
        let lineWidth: CGFloat = 1.0
        
            underline.borderColor = UIColor.orange.cgColor
        underline.frame = CGRect(
            x: 0,
            y: frame.size.height - lineWidth,
            width: frame.size.width,
            height: frame.size.height
        )
        underline.borderWidth = lineWidth
            
        //  Añadimos la línea a la pila de capas (layer stack)3
        layer.addSublayer(underline)
        layer.masksToBounds = true
    }

       override func setNeedsLayout() {
        super.setNeedsLayout()
        setupUnderline()
    }

}
