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
    var data: [Employees]?
    
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
                 let array: [Employees] = try! response.map(ResponseArrayAPI.self).data
                self.data = array
                self.tableView.reloadData()
            case .failure:
                print("Error")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
        let employees = data?[indexPath.row]
        cell?.configure(employees: employees)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: "OneEmployeeViewController") as? OneEmployeeViewController else { return }
        vc.id = data?[indexPath.row].id
            navigationController?.pushViewController(vc,
                                               animated: true)
    }

}

