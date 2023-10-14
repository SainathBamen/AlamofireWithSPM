//
//  ViewController.swift
//  AlamofireWithSPM
//
//  Created by Sainath Bamen on 11/09/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    var apiResult = [Model]()

    @IBOutlet weak var myTabelview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTabelview.delegate = self
        myTabelview.dataSource = self
        
        ApiHandler.shareInstance.fetchingAPIData {
            apiData in
                self.apiResult = apiData
            DispatchQueue.main.async {
                self.myTabelview.reloadData()
            }
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTabelview.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
        cell.textLabel?.text = apiResult[indexPath.row].title
        return cell
    }
    
    
}

