//
//  ViewController.swift
//  Employees
//
//  Created by Jordi Milla on 17/11/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let provider = MoyaProvider<EmployeesAPI>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestEmployees()
        setTable()
        
        
    }

    func setTable(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
    }
    
    func requestEmployees(){
        
        provider.request(.getEmployees) { result in
            switch result {
            case .success(let response):
                print("success")
//                let array: [Civilizations] = try! response.map(ResponseAPI.self).civilizations
//                self.data = array
//                self.tableView.reloadData()
            case .failure:
                print("Error")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }

}

