//
//  InlineConfigurable.swift
//  oitech
//
//  Created by Aruzhan Boranbay on 17.10.2024.
//

import Foundation

public protocol InlineConfigurable {}

extension NSObject: InlineConfigurable {}

public extension InlineConfigurable {
    @discardableResult
    func apply(_ configurator: (Self) -> Void) -> Self {
        configurator(self)
        return self
    }
}

