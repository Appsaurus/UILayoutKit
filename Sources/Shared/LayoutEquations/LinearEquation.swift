//
//  LinearEquation.swift
//  UILayoutKit
//
//  Created by Brian Strobach on 1/20/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

public protocol LinearEquatable {
    associatedtype Solution
    var solution: Solution { get }
}
public protocol LeftHandExpression {
    associatedtype E
    associatedtype LinearEquation: LinearEquatable
    typealias S = LinearEquation.Solution

    func relation(_ relation: Constraint.Relation, _ rhs: Self) -> LinearEquation
    func relation(_ relation: Constraint.Relation, _ rhs: E) -> LinearEquation
}

extension LeftHandExpression {

    @discardableResult
    public func equal(to rhs: Self) -> S {
        return relation(.equal, rhs).solution
    }

    @discardableResult
    public func equal(to rhs: E) -> S {
        return relation(.equal, rhs).solution
    }

    @discardableResult
    public func equal(to rhs: [Self]) -> [S] {
        return rhs.map { relation(.equal, $0).solution }
    }

    @discardableResult
    public func equal(to rhs: [E]) -> [S] {
        return rhs.map { relation(.equal, $0).solution }
    }

    @discardableResult
    public func lessThanOrEqual(to rhs: Self) -> S {
        return relation(.lessThanOrEqual, rhs).solution
    }

    @discardableResult
    public func lessThanOrEqual(to rhs: E) -> S {
        return relation(.lessThanOrEqual, rhs).solution
    }

    @discardableResult
    public func lessThanOrEqual(to rhs: [Self]) -> [S] {
        return rhs.map { relation(.lessThanOrEqual, $0).solution }
    }

    @discardableResult
    public func lessThanOrEqual(to rhs: [E]) -> [S] {
        return rhs.map { relation(.lessThanOrEqual, $0).solution }
    }

    @discardableResult
    public func greaterThanOrEqual(to rhs: Self) -> S {
        return relation(.greaterThanOrEqual, rhs).solution
    }

    @discardableResult
    public func greaterThanOrEqual(to rhs: E) -> S {
        return relation(.greaterThanOrEqual, rhs).solution
    }

    @discardableResult
    public func greaterThanOrEqual(to rhs: [Self]) -> [S] {
        return rhs.map { relation(.greaterThanOrEqual, $0).solution }
    }
    @discardableResult
    public func greaterThanOrEqual(to rhs: [E]) -> [S] {
        return rhs.map { relation(.greaterThanOrEqual, $0).solution }
    }
}

extension Array where Element: LeftHandExpression {
    // MARK: Anchor Array == Anchor
    @discardableResult
    public func equal(to rhs: Element) -> [Element.LinearEquation.Solution] {
        return map { $0.equal(to: rhs) }
    }

    // MARK: Anchor Array == Anchor Array
    @discardableResult
    public func equal(to rhs: [Element]) -> [[Element.LinearEquation.Solution]] {
        return map { $0.equal(to: rhs) }
    }

    // MARK: Anchor Array == Expression
    @discardableResult
    public func equal(to rhs: Element.E) -> [Element.LinearEquation.Solution] {
        return map { $0.equal(to: rhs) }
    }

    // MARK: Anchor Array == Expression Array
    @discardableResult
    public func equal(to rhs: [Element.E]) -> [[Element.LinearEquation.Solution]] {
        return map { $0.equal(to: rhs) }
    }

    // MARK: - LessThanOrEqual

    // MARK: Anchor Array <= Anchor
    @discardableResult
    public func lessThanOrEqual(to rhs: Element) -> [Element.LinearEquation.Solution] {
        return map { $0.lessThanOrEqual(to: rhs) }
    }

    // MARK: Anchor Array <= Anchor Array
    @discardableResult
    public func lessThanOrEqual(to rhs: [Element]) -> [[Element.LinearEquation.Solution]] {
        return map { $0.lessThanOrEqual(to: rhs) }
    }

    // MARK: Anchor Array <= Expression
    @discardableResult
    public func lessThanOrEqual(to rhs: Element.E) -> [Element.LinearEquation.Solution] {
        return map { $0.lessThanOrEqual(to: rhs) }
    }

    // MARK: Anchor Array <= Expression Array
    @discardableResult
    public func lessThanOrEqual(to rhs: [Element.E]) -> [[Element.LinearEquation.Solution]] {
        return map { $0.lessThanOrEqual(to: rhs) }
    }

    // MARK: - GreaterThanOrEqual

    // MARK: Anchor Array >= Anchor
    @discardableResult
    public func greaterThanOrEqual(to rhs: Element) -> [Element.LinearEquation.Solution] {
        return map { $0.greaterThanOrEqual(to: rhs) }
    }

    // MARK: Anchor Array >= Anchor Array
    @discardableResult
    public func greaterThanOrEqual(to rhs: [Element]) -> [[Element.LinearEquation.Solution]] {
        return map { $0.greaterThanOrEqual(to: rhs) }
    }

    // MARK: Anchor Array >= Expression
    @discardableResult
    public func greaterThanOrEqual(to rhs: Element.E) -> [Element.LinearEquation.Solution] {
        return map { $0.greaterThanOrEqual(to: rhs) }
    }

    // MARK: Anchor Array >= Expression Array
    @discardableResult
    public func greaterThanOrEqual(to rhs: [Element.E]) -> [[Element.LinearEquation.Solution]] {
        return map { $0.greaterThanOrEqual(to: rhs) }
    }
}

public protocol Variable {
    associatedtype E
    func plus(_ constant: LayoutConstant) -> E
    func minus(_ constant: LayoutConstant) -> E
    func times(_ multiplier: LayoutMultiplier) -> E
    func divided(by divisor: LayoutDivisor) -> E

}

//public protocol VariablePair {
//    associatedtype F: AnchorType
//    associatedtype S: AnchorType
//    associatedtype E: LayoutPairExpression<F, S>
//    func plus(_ constant: LayoutConstant) -> LayoutPairExpression<F, S>
//    func minus(_ constant: LayoutConstant) -> LayoutPairExpression<F, S>
//    func times(_ multiplier: LayoutMultiplier) -> LayoutPairExpression<F, S>
//    func divided(by divisor: LayoutDivisor) -> LayoutPairExpression<F, S>
//
//}

public protocol Coefficient {
    //    var constant: LayoutConstant { get set }
    //    var multiplier: LayoutMultiplier { get set }
}
public protocol Expression: class {

    associatedtype V//: Variable where V.Expression == Self
    associatedtype C: Coefficient
    //    var anchor: V { get set } //variable
    var configuration: C { get set } //coefficients
    //    init(anchor: V, configuration: LayoutConfiguration)
    func configured(with configuration: LayoutConfiguration) -> Self
    func with(constant: LayoutConstant) -> Self
    func with(multiplier: LayoutMultiplier) -> Self
}

extension Expression {
    @discardableResult
    public func configured(with configuration: C) -> Self {
        self.configuration = configuration
        return self
    }
}

extension Variable /*where LayoutAnchor<Self> == E.V*/ {
    public func minus(_ constant: LayoutConstant) -> E {
        return plus(-constant)
    }
    public func divided(by divisor: LayoutDivisor) -> E {
        return times(1.0 / divisor)
    }

    //    public func plus(_ constant: LayoutConstant) -> E {
    //        return E.init(anchor: self, configuration: .constant(constant))
    //    }
    //
    //    public func times(_ multiplier: LayoutMultiplier) -> E {
    //        return E.init(anchor: self, configuration: .multiplier(multiplier))
    //    }

}

extension Array: Variable where Element: Variable {

    public typealias E = [Element.E]

    public func plus(_ constant: LayoutConstant) -> [Element.E] {
        return self.map { $0.plus(constant) }
    }

    public func times(_ multiplier: LayoutMultiplier) -> [Element.E] {
        return self.map { $0.times(multiplier) }
    }
}

extension LayoutRelationship: LinearEquatable {
    public typealias Solution = Constraint

    public var solution: Constraint {
        return constraint
    }
}

extension Array: LinearEquatable where Element: LinearEquatable {
    public typealias Solution = [Element.Solution]

    public var solution: Solution {
        return map { $0.solution }
    }
}
