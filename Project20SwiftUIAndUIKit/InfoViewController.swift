//
//  InfoViewController.swift
//  Project20SwiftUIAndUIKit
//
//  Created by Janesh Suthar on 22/05/21.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet var txtView:UITextView!
    
    @IBOutlet var changeRollNumerButton:UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didTapClose() {
        dismiss(animated: true, completion: nil)
    }



}
