// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

//
//  +PriorityOperators.swift
//  UILayoutKit
//
//  Created by Brian Strobach on 1/4/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//
@discardableResult
public func ~ (lhs: XAxisAnchorPair, rhs: LayoutPriority) -> XAxisAnchorPairExpression {
    return XAxisAnchorPairExpression(anchors: lhs).with(priority: rhs)
}

@discardableResult
public func ~ (lhs: XAxisAnchorPairExpression, rhs: LayoutPriority) -> XAxisAnchorPairExpression {
    return lhs.with(priority: rhs)
}
