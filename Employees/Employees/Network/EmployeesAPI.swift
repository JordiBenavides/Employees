//
//  EmployeesAPI.swift
//  Employees
//
//  Created by Jordi Milla on 17/11/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Moya

enum EmployeesAPI {
    
    case getEmployees
    case getEmploById(id: String)
    
}

extension EmployeesAPI:TargetType,AccessTokenAuthorizable {
    public var baseURL: URL {  return URL(string: "http://dummy.restapiexample.com/api/v1/")!}
    
    public var path: String {
        switch self {
        case .getEmployees:
            return "employees"
            
        case .getEmploById(id: let id):
            return "employee/\(id)"
            
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .getEmployees:
            return .get
            
        case .getEmploById(id: _):
            return .get
            
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        case .getEmployees:
            return .bearer
            
        case .getEmploById(id: _):
            return .bearer
            
        }
    }
    
    public var task: Task {
        switch self {
        case .getEmployees:
            return .requestPlain
            
        case .getEmploById(id: _):
            return .requestPlain
            
        }
    }
    
    public var validationType: ValidationType {
        return .none
        
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
        
    }
    
    public var headers: [String: String]? {
        return nil
        
    }
}
