// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

//
//  View+LayoutDimensionPairRelationOperators.swift
//  UILayoutKit
//
//  Created by Brian Strobach on 1/4/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

// MARK: - Equal

// MARK: View == Anchor
@discardableResult
public func .= (lhs: View, rhs: LayoutDimensionPair) -> LayoutDimensionPair.Solution {
    return lhs[keyPath: ...rhs].equal(to: rhs)
}
// MARK: View == Expression
@discardableResult
public func .= (lhs: View, rhs: LayoutDimensionPairExpression) -> LayoutDimensionPair.Solution {
    return lhs[keyPath: ...rhs].equal(to: rhs)
}

// MARK: - LessThanOrEqual

// MARK: View <= Anchor
@discardableResult
public func ≤ (lhs: View, rhs: LayoutDimensionPair) -> LayoutDimensionPair.Solution {
    return lhs[keyPath: ...rhs].lessThanOrEqual(to: rhs)
}
// MARK: View <= Expression
@discardableResult
public func ≤ (lhs: View, rhs: LayoutDimensionPairExpression) -> LayoutDimensionPair.Solution {
    return lhs[keyPath: ...rhs].lessThanOrEqual(to: rhs)
}

// MARK: - GreaterThanOrEqual

// MARK: View >= Anchor
@discardableResult
public func ≥ (lhs: View, rhs: LayoutDimensionPair) -> LayoutDimensionPair.Solution {
    return lhs[keyPath: ...rhs].greaterThanOrEqual(to: rhs)
}
// MARK: View >= Expression
@discardableResult
public func ≥ (lhs: View, rhs: LayoutDimensionPairExpression) -> LayoutDimensionPair.Solution {
    return lhs[keyPath: ...rhs].greaterThanOrEqual(to: rhs)
}

// MARK: - rhs collection -

// MARK: - Equal

// MARK: View == Anchors
@discardableResult
public func .= (lhs: View, rhs: LayoutDimensionPairs) -> [LayoutDimensionPair.Solution] {
    return rhs.map({lhs .= $0})
}

// MARK: View == Expressions
@discardableResult
public func .= (lhs: View, rhs: LayoutDimensionPairExpressions) -> [LayoutDimensionPair.Solution] {
    return rhs.map({lhs .= $0})
}

// MARK: - LessThanOrEqual

// MARK: View <= Anchors
@discardableResult
public func ≤ (lhs: View, rhs: LayoutDimensionPairs) -> [LayoutDimensionPair.Solution] {
    return rhs.map({lhs ≤ $0})
}
// MARK: View <= Expressions
@discardableResult
public func ≤ (lhs: View, rhs: LayoutDimensionPairExpressions) -> [LayoutDimensionPair.Solution] {
    return rhs.map({lhs ≤ $0})
}

// MARK: - GreaterThanOrEqual

// MARK: View >= Anchors
@discardableResult
public func ≥ (lhs: View, rhs: LayoutDimensionPairs) -> [LayoutDimensionPair.Solution] {
    return rhs.map({lhs ≥ $0})
}
// MARK: View >= Expressions
@discardableResult
public func ≥ (lhs: View, rhs: LayoutDimensionPairExpressions) -> [LayoutDimensionPair.Solution] {
    return rhs.map({lhs ≥ $0})
}
