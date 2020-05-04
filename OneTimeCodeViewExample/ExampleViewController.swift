//
//  ExampleViewController.swift
//  OneTimeCodeViewExample
//
//  Created by Андрей Дробязко on 04.05.2020.
//  Copyright © 2020 Andrii Drobiazko. All rights reserved.
//

import Foundation
import UIKit


class ExampleViewController: UIViewController {
    
    @IBOutlet weak var oneTimeCodeView: OneTimeCodeView!
    
    override func viewDidAppear(_ animated: Bool) {
        oneTimeCodeView.configure()
    }
}
