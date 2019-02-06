//
//  EdgeAnchorGroup+PriorityOperators.swift
//  UILayoutKit
//
//  Created by Brian Strobach on 1/10/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

@discardableResult
public func ~ (lhs: LayoutInset, rhs: LayoutPriority) -> EdgeAnchorsGroupCoefficients {
    return lhs.priority(rhs)
}
