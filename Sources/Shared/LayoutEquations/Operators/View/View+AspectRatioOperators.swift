//
//  View+AspectRatioOperators.swift
//  UILayoutKit
//
//  Created by Brian Strobach on 1/17/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

// MARK: AspectRatioAnchor == AspectRatio
@discardableResult
public func == (lhs: AspectRatioAnchor, rhs: AutoLayoutAspectRatio) -> Constraint {
    return lhs == AutoLayoutAspectRatioConfiguration(rhs)
}

@discardableResult
public func == (lhs: AspectRatioAnchor, rhs: AutoLayoutAspectRatioConfiguration) -> Constraint {
    switch lhs {
    case .standard(let view):
        precondition(view.constraint(for: .width) != nil, "You must set a width constraint before setting an aspect ratio constraint.")
        return view.heightAnchor == view.widthAnchor * rhs.aspectRatio.ratio ~ rhs.priority
    case .inverse(let view):
        precondition(view.constraint(for: .height) != nil, "You must set a height constraint before setting an inverse aspect ratio constraint.")
        return view.widthAnchor == view.heightAnchor * (1 / rhs.aspectRatio.ratio) ~ rhs.priority
    }
}

// MARK: View == AspectRatio
@discardableResult
public func == (lhs: View, rhs: AutoLayoutAspectRatio) -> Constraint {
    return lhs.aspectRatioAnchor == rhs
}

@discardableResult
public func == (lhs: View, rhs: AutoLayoutAspectRatioConfiguration) -> Constraint {
    return lhs.aspectRatioAnchor == rhs
}

public final class AutoLayoutAspectRatioConfiguration {
    public var aspectRatio: AutoLayoutAspectRatio
    public var priority: LayoutPriority

    public init(_ aspectRatio: AutoLayoutAspectRatio, _ priority: LayoutPriority = .required) {
        self.aspectRatio = aspectRatio
        self.priority = priority
    }
}

public func ~ (lhs: AutoLayoutAspectRatio, rhs: LayoutPriority) -> AutoLayoutAspectRatioConfiguration {
    return AutoLayoutAspectRatioConfiguration(lhs, rhs)
}

public enum AspectRatioAnchor {
    case standard(View)
    case inverse(View)
}

extension View {
    public var aspectRatioAnchor: AspectRatioAnchor {
        return .standard(self)
    }

    public var aspectRatioInverseAnchor: AspectRatioAnchor {
        return .inverse(self)
    }
}

extension Collection where Element: View {
    public var aspectRatioAnchor: [AspectRatioAnchor] {
        return map {.standard($0)}
    }

    public var aspectRatioInverseAnchor: [AspectRatioAnchor] {
        return map {.inverse($0)}
    }
}
