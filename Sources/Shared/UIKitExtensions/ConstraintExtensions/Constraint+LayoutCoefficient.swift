//
//  Constraint+LayoutCoefficient.swift
//  UILayoutKit
//
//  Created by Brian Strobach on 2/6/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

extension Constraint {
    public func configured(with coefficients: LayoutCoefficient) -> Constraint {
        let constraint = Constraint(item: firstItem as Any,
                                    attribute: firstAttribute,
                                    relatedBy: relation,
                                    toItem: secondItem,
                                    attribute: secondAttribute,
                                    multiplier: coefficients.multiplier?.value ?? 1.0,
                                    constant: coefficients.constant)

        return constraint.priority(coefficients.priority)
    }

    public func times(_ multiplier: LayoutConstant) -> Constraint {

        return Constraint(item: firstItem as Any,
                          attribute: firstAttribute,
                          relatedBy: relation,
                          toItem: secondItem,
                          attribute: secondAttribute,
                          multiplier: multiplier,
                          constant: constant)
    }

    @discardableResult
    public func priority(_ priority: LayoutPriority) -> Self {
        self.priority = priority
        return self
    }
}
