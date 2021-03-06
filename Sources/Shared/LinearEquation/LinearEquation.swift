//
//  LinearEquation.swift
//  UILayoutKit
//
//  Created by Brian Strobach on 1/20/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

public protocol LinearEquationTyped {
    associatedtype LinearEquation: UILayoutKit.LinearEquation
    typealias RightHandExpression = LinearEquation.Expression
    typealias Solution = LinearEquation.Solution
    typealias LayoutVariable = LinearEquation.Variable
    typealias Relation = LinearEquation.Relation
    typealias Expression = LinearEquation.Expression
    typealias Coefficient = Expression.Coefficients
    typealias Constant = Coefficient.Constant
    typealias Multiplier = Coefficient.Multiplier
}

public protocol LinearEquationSolving {
    associatedtype Expression: UILayoutKit.Expression
    associatedtype Solution
    var solution: Solution { get }
}

extension Array: LinearEquationSolving where Element: LinearEquationSolving {
    public typealias Expression = Element.Expression
    public typealias Solution = [Element.Solution]    

    public var solution: Solution {
        return map { $0.solution }
    }
}

public protocol LinearEquation: Expression, LinearEquationSolving where Expression.Variable == Variable, Expression.Coefficients == Coefficients {
    associatedtype Relation
    var relation: Relation { get set }
    var relatedVariable: Variable? { get set }
    init(_ variable: Variable, _ relation: Relation, _ relatedExpression: Expression)
    init(_ variable: Variable, _ relation: Relation, _ relatedVariable: Variable)
    init(_ variable: Variable, _ relation: Relation, _ relatedVariable: Variable?, _ coefficients: Coefficients)
    init(_ variable: Variable, _ relation: Relation, _ constant: Coefficients.Constant)
}

extension LinearEquation {

    public init(_ variable: Variable,
                _ relation: Relation,
                _ relatedExpression: Expression) {
        self.init(variable,
                  relation,
                  relatedExpression.variable,
                  relatedExpression.coefficients)
    }

    public init(_ variable: Variable, _ relation: Relation, _ relatedVariable: Variable) {
        self.init(variable, relation, relatedVariable, .default)
    }

    public init(_ variable: Variable, _ relation: Relation, _ coefficients: Coefficients) {
        self.init(variable, relation, nil, coefficients)
    }

    public init(_ variable: Variable,
                _ relation: Relation,
                _ constant: Coefficients.Constant) {
        self.init(variable, relation, .constant(constant))
    }
}

//public protocol CoefficientTyped {
//    associatedtype Coefficient: CoefficientMutating
//    typealias Constant = Coefficient.Constant
//    typealias Multiplier = Coefficient.Multiplier
//    typealias Divisor = Coefficient.Constant
//}
