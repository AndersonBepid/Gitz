//
//  InteractorResult.swift
//  FastTrade
//
//  Created by usuario on 21/08/2018.
//  Copyright © 2018 Cedro Technologies. All rights reserved.
//

import Foundation

enum InteractorResult<Resource> {
    case success(Resource)
    case failure(Error)
}

enum InteractorCompletableResult {
    case completed
    case failure(Error)
}

extension InteractorResult {
    var resource: Resource? {
        if case let .success(resource) = self {
            return resource
        }
        return nil
    }

    var error: Error? {
        if case let .failure(error) = self {
            return error
        }
        return nil
    }
}
