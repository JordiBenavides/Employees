//
//  CustomTableViewCell.swift
//  Employees
//
//  Created by Jordi Milla on 17/11/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    
    var data: Employees?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
    func configure(employees:Employees?){
        
        self.data = employees
        nameLabel.text = data?.employee_name ?? ""
        ageLabel.text = data?.employee_age ?? ""
        salaryLabel.text = data?.employee_salary ?? ""
    }
    
}
