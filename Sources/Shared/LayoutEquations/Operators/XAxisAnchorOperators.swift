//
//  XAxisAnchorOperators.swift
//  UILayoutKit
//
//  Created by Brian Strobach on 1/4/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

//MARK: Equal
//MARK: Anchor == Expression
@discardableResult
public func == (lhs: LayoutAnchor<XAxisAnchor>, rhs: LayoutExpression<XAxisAnchor>) -> Constraint{
    return LayoutRelationEquation(anchor: lhs,
                                  relation: .equal,
                                  relatedAnchor: rhs.anchor,
                                  configuration: rhs.configuration).constraint
}


//MARK: Anchor == Anchor
@discardableResult
public func == (lhs: LayoutAnchor<XAxisAnchor>, rhs: LayoutAnchor<XAxisAnchor>) -> Constraint {
    return LayoutRelationEquation(anchor: lhs,
                                  relation: .equal,
                                  relatedAnchor: rhs).constraint
}

//MARK: LessThanOrEqual
//MARK: Anchor <= Expression
@discardableResult
public func <= (lhs: LayoutAnchor<XAxisAnchor>, rhs: LayoutExpression<XAxisAnchor>) -> Constraint{
    return LayoutRelationEquation(anchor: lhs,
                                  relation: .lessThanOrEqual,
                                  relatedAnchor: rhs.anchor,
                                  configuration: rhs.configuration).constraint
}


//MARK: Anchor <= Anchor
@discardableResult
public func <= (lhs: LayoutAnchor<XAxisAnchor>, rhs: LayoutAnchor<XAxisAnchor>) -> Constraint {
    return LayoutRelationEquation(anchor: lhs,
                                  relation: .lessThanOrEqual,
                                  relatedAnchor: rhs).constraint
}

//MARK: GreaterThanOrEqual
//MARK: Anchor >= Expression
@discardableResult
public func >= (lhs: LayoutAnchor<XAxisAnchor>, rhs: LayoutExpression<XAxisAnchor>) -> Constraint{
    return LayoutRelationEquation(anchor: lhs,
                                  relation: .greaterThanOrEqual,
                                  relatedAnchor: rhs.anchor,
                                  configuration: rhs.configuration).constraint
}


//MARK: Anchor >= Anchor
@discardableResult
public func >= (lhs: LayoutAnchor<XAxisAnchor>, rhs: LayoutAnchor<XAxisAnchor>) -> Constraint {
    return LayoutRelationEquation(anchor: lhs,
                                  relation: .greaterThanOrEqual,
                                  relatedAnchor: rhs).constraint
}

//MARK: Constant Arithmetic
@discardableResult
public func + (lhs: LayoutAnchor<XAxisAnchor>, rhs: LayoutConstant) -> LayoutExpression<XAxisAnchor> {
    return LayoutExpression<XAxisAnchor>(anchor: lhs, configuration: LayoutConfiguration(constant: rhs))
}

@discardableResult
public func / (lhs: LayoutAnchor<XAxisAnchor>, rhs: LayoutConstant) -> LayoutExpression<XAxisAnchor> {
    return lhs * (1.0 / rhs)
}

@discardableResult
public func * (lhs: LayoutAnchor<XAxisAnchor>, rhs: LayoutConstant) -> LayoutExpression<XAxisAnchor> {
    return LayoutExpression<XAxisAnchor>(anchor: lhs, configuration: LayoutConfiguration(multiplier: rhs))
}