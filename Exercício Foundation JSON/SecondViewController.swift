//
//  SecondViewController.swift
//  Exercício Foundation JSON
//
//  Created by Lucas Pinheiro Almeida on 10/12/2018.
//  Copyright © 2018 Lucas Pinheiro Almeida. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var hour: UITextField!
    
    @IBAction func didTabSaveButton(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.delegate?.register(self, didRegisterText: self.text.text!, didRegisterHour: self.hour.text!)
        }
    }
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    weak var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol SecondViewControllerDelegate: class {
    func register(_ controller: SecondViewController, didRegisterText text: String, didRegisterHour hour: String)
}
