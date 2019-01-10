//
//  EdgeAnchorsExpression.swift
//  UILayoutKit
//
//  Created by Brian Strobach on 1/10/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

public class EdgeAnchorsExpression: SidesTuple<XAxisAnchor, YAxisAnchor>{
    public var configurations: EdgeAnchorsConfiguration = .default

    public convenience init(anchors: EdgeAnchors, configurations: EdgeAnchorsConfiguration = .default){
        self.init(anchors)
        self.configurations = configurations
    }

    required public init(_ top: YAxisAnchor,
                         _ leading: XAxisAnchor,
                         _ bottom: YAxisAnchor,
                         _ trailing: XAxisAnchor) {
        super.init(top, leading, bottom, trailing)
    }

    @discardableResult
    public func configured(with configurations: EdgeAnchorsConfiguration) -> Self{
        self.configurations = configurations
        return self
    }

    @discardableResult
    public func configured(with configuration: LayoutConfiguration) -> Self{
        self.configurations = EdgeAnchorsConfiguration(configuration)
        return self
    }

    @discardableResult
    public func with(constant: LayoutConstant) -> Self{
        configurations.all.forEach{$0.constant = constant}
        return self
    }

    @discardableResult
    public func with(multiplier: LayoutMultiplier) -> Self{
        configurations.all.forEach{$0.multiplier = multiplier}
        return self
    }

    @discardableResult
    public func with(priority: LayoutPriority) -> Self{
        configurations.all.forEach{$0.priority = priority}
        return self
    }
}
