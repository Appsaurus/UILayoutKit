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

extension Array: LinearEquatable where Element: LinearEquatable {
    public typealias Solution = [Element.Solution]

    public var solution: Solution {
        return map { $0.solution }
    }
}

public protocol Expression: class {

    associatedtype V//: Variable where V.Expression == Self
    associatedtype C: CoefficientMutating
    //    var anchor: V { get set } //variable
    var configuration: C { get set } //coefficients
    //    init(anchor: V, configuration: LayoutConfiguration)
    func configured(with configuration: C) -> Self
    func with(constant: C.Constant) -> Self
    func with(multiplier: C.Multiplier) -> Self
    func with(priority: C.Priority) -> Self
}

extension Expression {
    @discardableResult
    public func configured(with configuration: C) -> Self {
        self.configuration = configuration
        return self
    }

    @discardableResult
    public func with(priority: C.Priority) -> Self {
        configuration.set(priority: priority)
        return self
    }

    @discardableResult
    public func with(constant: C.Constant) -> Self {
        configuration.set(constant: constant)
        return self
    }

    @discardableResult
    public func with(multiplier: C.Multiplier) -> Self {
        configuration.set(multiplier: multiplier)
        return self
    }
}

public protocol CoefficientMutating {
    associatedtype Constant
    associatedtype Multiplier
    associatedtype Priority
    func set(constant: Constant)
    func set(multiplier: Multiplier)
    func set(priority: Priority)

    static func constant(_ constant: Constant) -> Self
    static func multiplier(_ multiplier: Multiplier) -> Self
    static func priority(_ priority: Priority) -> Self
}

extension CoefficientMutating {

    public func with(constant: Constant) -> Self {
        set(constant: constant)
        return self
    }

    public func with(multiplier: Multiplier) -> Self {
        set(multiplier: multiplier)
        return self
    }

    public func with(priority: Priority) -> Self {
        set(priority: priority)
        return self
    }
}

public protocol Coeficient: CoefficientMutating {
    var constant: Constant { get set }
    var multiplier: Multiplier { get set }
    var priority: Priority { get set }
    init()
}

extension Coeficient {

    public static func constant(_ constant: Constant) -> Self {
        return Self().with(constant: constant)
    }
    public static func multiplier(_ multiplier: Multiplier) -> Self {
        return Self().with(multiplier: multiplier)
    }
    public static func priority(_ priority: Priority) -> Self {
        return Self().with(priority: priority)
    }
}
