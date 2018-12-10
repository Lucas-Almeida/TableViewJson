//
//  ViewController.swift
//  Exercício Foundation JSON
//
//  Created by Lucas Pinheiro Almeida on 10/12/2018.
//  Copyright © 2018 Lucas Pinheiro Almeida. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {
    func register(_ controller: SecondViewController, didRegisterText text: String, didRegisterHour hour: String) {
        
//        var json = JsonModel(from: Decoder as! Decoder)
//        jsonEntry.text = text
//        jsonEntry.create_date = hour
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addEntry(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "add", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "add", let navigation = segue.destination as? UINavigationController, let controller = navigation.topViewController as? SecondViewController {
//            controller.delegate = self
//        }
        
    }
    
    var jsonArray = [JsonModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        doGetJson()
    }
    
    func doGetJson() {
        let url = URL(string: "https://ios-twitter.herokuapp.com/api/v1/message")!

        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in

            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    print("Fail")
                }
                return
            }
            do {
                let decode = try JSONDecoder().decode([JsonModel].self, from: data)
                
                for item in decode {
                    self.jsonArray.append(item)
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let parsinError {
                print("Error", parsinError)
            }
        }
        task.resume()
    }
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jsonCell", for: indexPath) as! JsonTableViewCell
        
        let arrayCell = jsonArray[indexPath.row]
        
        let hourMinute = arrayCell.create_date.index(
            arrayCell.create_date.startIndex, offsetBy: 11)..<arrayCell.create_date.index(arrayCell.create_date.endIndex, offsetBy: -8)
        let result = arrayCell.create_date[hourMinute]
        
        cell.jsonText.text = arrayCell.text
        cell.created_date.text = String(result)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            jsonArray.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}

