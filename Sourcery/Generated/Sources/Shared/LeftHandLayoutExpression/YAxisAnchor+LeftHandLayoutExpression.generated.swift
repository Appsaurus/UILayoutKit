// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

//
//  YAxisAnchor+LeftHandLayoutExpression.swift
//  UILayoutKit
//
//  Created by Brian Strobach on 1/4/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

extension YAxisAnchor: LeftHandLayoutExpression, CoefficientEquatable {
    public typealias LinearEquation = YAxisAnchorEquation

    public func relation(_ relation: Relation, _ rhs: YAxisAnchor) -> LinearEquation {
        return LinearEquation(self, relation, rhs)
    }

    public func relation(_ relation: Relation, _ rhs: RightHandExpression) -> LinearEquation {
        return LinearEquation(self, relation, rhs)
    }

    public func relation(_ relation: Relation, _ rhs: Constant) -> LinearEquation {
        return LinearEquation(self, relation, rhs)
    }

    public func relation(_ relation: Relation, _ rhs: Multiplier) -> LinearEquation {
        return LinearEquation(self, relation, .multiplier(rhs))
    }

    public func relation(_ relation: Relation, _ rhs: Coefficient) -> LinearEquation {
        return LinearEquation(self, relation, rhs)
    }
}
