//
//  InteractorResult.swift
//  Gitz
//
//  Created by Anderson Oliveira on 28/10/18.
//  Copyright (c) 2018 Anderson Oliveira. All rights reserved.
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
