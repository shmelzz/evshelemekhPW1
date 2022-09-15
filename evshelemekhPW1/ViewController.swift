//
//  ViewController.swift
//  evshelemekhPW1
//
//  Created by Lisa Shell on 14.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var views: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundCorners()
    }
    
    func roundCorners(){
        for view in self.views {
            view.layer.cornerRadius = 10
        }
    }
    
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        var set = Set<UIColor>()
        while set.count < views.count {
            set.insert(
                UIColor(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1),
                    alpha: 1
                )
            )
        }
        
        let button = sender as? UIButton
        button?.isEnabled = false
        
        UIView.animate(withDuration: 1, animations: {
            for view in self.views {
                view.backgroundColor = set.popFirst()
            }
        }) { completion in
            button?.isEnabled = true
        }
    }
}
