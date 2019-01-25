// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

//
//  LayoutDimension+ArrayConstantArithmeticOperators.swift
//  UILayoutKit
//
//  Created by Brian Strobach on 1/4/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

@discardableResult
public func + (lhs: LayoutDimensions, rhs: LayoutConstant) -> LayoutDimensionExpressions {
    return lhs.plus(rhs)
}

@discardableResult
public func - (lhs: LayoutDimensions, rhs: LayoutConstant) -> LayoutDimensionExpressions {
    return lhs.minus(rhs)
}

@discardableResult
public func * (lhs: LayoutDimensions, rhs: LayoutMultiplier) -> LayoutDimensionExpressions {
    return lhs.times(rhs)
}

@discardableResult
public func * (lhs: LayoutMultiplier, rhs: LayoutDimensions ) -> LayoutDimensionExpressions {
    return rhs.times(lhs)
}

@discardableResult
public func / (lhs: LayoutDimensions, rhs: LayoutDivisor) -> LayoutDimensionExpressions {
    return lhs.divided(by: rhs)
}

@discardableResult
public func / (lhs: LayoutDimensionExpressions, rhs: LayoutDivisor) -> LayoutDimensionExpressions {
    return lhs.map { $0.with(multiplier: (1.0 / rhs)) }
}
