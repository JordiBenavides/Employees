//
//  Employees.swift
//  Employees
//
//  Created by Jordi Milla on 17/11/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation

struct ResponseArrayAPI: Codable {
    let status: String?
    let data:[Employees]
}

struct ResponseAPI: Codable {
    let status: String?
    let data: Employees0?
}

struct Employees: Codable {
    let id: String?
    let employee_name: String?
    let employee_salary: String?
    let employee_age: String?
}

struct Employees0: Codable {
    let id: Int?
    let employee_name: String?
    let employee_salary: Int?
    let employee_age: Int?
}
