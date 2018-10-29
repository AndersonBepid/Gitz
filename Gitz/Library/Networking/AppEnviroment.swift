//
//  EnviromentURL.swift
//  FastTrade
//
//  Created by usuario on 27/09/18.
//  Copyright © 2018 Cedro Technologies. All rights reserved.
//

import Foundation

enum AppEnviroment {

    case gitz

    var workspacesURL: String {
        switch self {
        case .gitz:
            return "https://api.github.com"
        }
    }
}
