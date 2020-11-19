//
//  ViewController.swift
//  KVC
//
//  Created by Damir Lutfullin on 18.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user.addObserver(self, forKeyPath: #keyPath(User.name), options: [.new, .old], context: nil)
        
        user.willChangeValue(forKey: "name")
        user.setValue("Jin", forKey: "name")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.user.willChangeValue(forKey: "name")
            self.user.setValue("Klee", forKey: "name")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        user.removeObserver(self, forKeyPath: "name")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard keyPath == #keyPath(User.name),
             let change = change else { return }
        nameLabel.text = change[.newKey] as? String
    }
    
    @IBAction func didChange() {
        self.user.didChangeValue(forKey: "name")
    }
}

