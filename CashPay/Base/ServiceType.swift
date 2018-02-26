//
//  ServiceType.swift
//  topUpNp
//
//  Created by Rojan on 1/25/2561 BE.
//  Copyright © 2561 Rojan. All rights reserved.
//

import Foundation

protocol ServiceType {
    var apiService: Authorization {get}
    var baseUrl: String {get}
}

extension ServiceType {
    var apiService: Authorization { return Authorization.shared}
    var baseUrl: String { return apiService.baseUrl() }
}

