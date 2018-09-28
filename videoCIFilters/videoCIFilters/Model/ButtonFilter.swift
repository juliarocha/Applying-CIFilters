//
//  ButtonFilter.swift
//  videoCIFilters
//
//  Created by Julia Rocha on 27/09/18.
//  Copyright © 2018 Julia Rocha. All rights reserved.
//

 /*
 Link dos filtros: https://developer.apple.com/library/archive/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/uid/TP30000136-SW118
 */

import Foundation
import CoreImage
import UIKit

class ButtonFilter:UIButton {
    
    var filter:String?
    var theView:UIViewController?
    
    init( filterName: String, view: UIViewController) {
        
        switch filterName {
        case "P&B":
            super.init(frame: CGRect(x: 25, y: 500, width: 100, height: 50))
            
        case "Bump":
            super.init(frame: CGRect(x: 245, y: 500, width: 100, height: 50))
            
            
        default:
            super.init(frame: CGRect(x: 135, y: 500, width: 100, height: 50))
        }
        
        self.setTitle(filterName, for: UIControl.State.normal)
        self.setTitleColor(UIColor.init(hex: 0x72779E), for: UIControl.State.normal)
        self.filter = filterName
        self.theView = view
        self.layer.borderColor = UIColor.init(hex: 0x72779E).cgColor
        self.layer.borderWidth = 3.0
        self.clipsToBounds = true
        
        self.addTarget(self, action: #selector(self.applyFilter(_:)), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    //Função de aplicar o filtro
    @objc func applyFilter(_ sender: AnyObject) -> Void {
        
        //Achar a UIImageView na view
        for layer in (self.theView?.view.subviews)! {
            
            if let photo = layer as? Image {
                
                //Retirar o filtro atual
                photo.reset
                
                
                //Pegar a imagem da UIImageView
                let inputImage = photo.image
                
                //Inicializar um contexto para renderizar a imagem final
                let context = CIContext(options: nil)
                
                
                
                //Escolher o filtro
                var filter:String?
                
                switch self.filter {
                case "P&B":
                    filter = "CIPhotoEffectNoir"
                    
                case "Blur":
                    filter = "CIGaussianBlur"
                    
                case "Bump":
                    filter = "CIBumpDistortion"
                    
                default:
                    filter = ""
                }
                
                //Aplicação do filtro - inicializar o filtro escolhido
                if let currentFilter = CIFilter(name: filter!) {
                    
                    //Converter a UIImage em CIImage
                    let beginImage = CIImage(image: inputImage!)
                    
                    //Setar o input da imagem do filtro como a CIImage
                    currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
                    
                    
                    //adicionar parametros adicionais -caso não queira os valores default
                    if self.filter == "Bump" {
                        currentFilter.setValue(CIVector(x: 2500, y: 2000), forKey: kCIInputCenterKey)
                        currentFilter.setValue(2000, forKey: kCIInputRadiusKey)
                    }
                    
                    
                    //output da imagem
                    if let output = currentFilter.outputImage {
                        
                        //Fazer a renderização da CIImage processada com o CIContext
                        if let cgimg = context.createCGImage(output, from: output.extent) {
                            
                            //Converter de volta para UIImage
                            let processedImage = UIImage(cgImage: cgimg)

                            //Setar de volta como a UIImage da UIImageView
                            photo.image = processedImage
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    
    
}


