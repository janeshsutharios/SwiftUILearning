//
//  ViewController.swift
//  Project20SwiftUIAndUIKit
//
//  Created by Janesh Suthar on 22/05/21.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        let delegate = ContactPickerDelegate()
        delegate.contact = "Hello Janesh"
        delegate.designation = "iOS Developer"
        let vc = UIHostingController(rootView: SwiftUIView(delegate: delegate))
       // let vc = UIHostingController(rootView: CombineExampleView())
        present(vc, animated: true, completion: nil)
    }
    
}

class ContactPickerDelegate:ObservableObject {
    
    @Published var designation:String = "Android Developer"
    var contact: String? {
        //        willSet {
        //            objectWillChange.send()
        //        }
        didSet {
            objectWillChange.send()
        }
    }
}

