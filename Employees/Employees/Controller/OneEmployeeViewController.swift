//
//  OneEmployeeViewController.swift
//  Employees
//
//  Created by Jordi Milla on 17/11/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

class OneEmployeeViewController: UIViewController {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelSalary: UILabel!
    
    let provider = MoyaProvider<EmployeesAPI>()
    var id: String?
    var data: Employees0?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestEmploById()

    }

    func updateLabels(){
        let str1 = "\(data?.employee_age ?? 0)"
        let str2 = "\(data?.employee_salary ?? 0)"
        labelName.text = data?.employee_name
        labelAge.text = str1
        labelSalary.text = str2
    }
    
    func requestEmploById() {

        provider.request(.getEmploById(id: id ?? "")) { result in
            switch result {
            case .success(let response):
                print("success")
                let employe : Employees0? = try! response.map(ResponseAPI.self).data
                self.data = employe
                self.updateLabels()
            case .failure:
                print("Error")
            }
        }
    }
}
