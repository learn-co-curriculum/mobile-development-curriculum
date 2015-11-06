//
//  ViewController.swift
//  swift-playground
//
//  Created by Mark Murray on 9/24/15.
//  Copyright © 2015 Mark Murray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


class Present {
    var description: String = "firetruck"
}

class ChristmasTree {
    var presents = [Present?]()
    
    func openNextPresent() -> Present {
        if let present = self.presents.removeLast() {
            return present
        }
    }
}
