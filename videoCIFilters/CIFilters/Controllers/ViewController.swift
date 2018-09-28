//
//  ViewController.swift
//  videoCIFilters
//
//  Created by Julia Rocha on 26/09/18.
//  Copyright © 2018 Julia Rocha. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {
    
    var photo:Image?

    @IBOutlet weak var navigationBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.        
      
        displayImage()
        displayFilterButtons()
        self.navigationBar.rightBarButtonItem?.action = #selector(self.reset(_:))
        
    }
    
    
    func displayFilterButtons() {
        let buttonSepia = ButtonFilter(filterName: "P&B", view: self)
        self.view.addSubview(buttonSepia)
        let buttonBlur = ButtonFilter(filterName: "Blur", view: self)
        self.view.addSubview(buttonBlur)
        let buttonBump = ButtonFilter(filterName: "Bump", view: self)
        self.view.addSubview(buttonBump)

    }
    
    func displayImage() {
        photo = Image()
        self.view.addSubview(photo!)
    }
    
    
    @objc func reset(_ theObject: AnyObject){
        photo?.reset
    }


}

