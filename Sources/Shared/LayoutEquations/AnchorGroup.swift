//
//  AnchorGroup.swift
//  UILayoutKit
//
//  Created by Brian Strobach on 1/7/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//

#if canImport(Cocoa)
import Cocoa
#else
import UIKit
#endif


public typealias Autolayoutable = LayoutAnchorable & LayoutConstrainable

public protocol LayoutConstrainable {}

extension UIView: LayoutConstrainable{}
extension UILayoutGuide: LayoutConstrainable{}
extension UIViewController: LayoutConstrainable{}

public protocol LayoutAnchorable {

    var leadingAnchor: XAxisAnchor { get }
    var trailingAnchor: XAxisAnchor { get }
    var leftAnchor: XAxisAnchor { get }
    var rightAnchor: XAxisAnchor { get }
    var topAnchor: YAxisAnchor { get }
    var bottomAnchor: YAxisAnchor { get }
//    var widthAnchor: LayoutDimension { get }
//    var heightAnchor: LayoutDimension { get }
//    var centerXAnchor: XAxisAnchor { get }
//    var centerYAnchor: YAxisAnchor { get }
//    var firstBaselineAnchor: YAxisAnchor { get }
//    var lastBaselineAnchor: YAxisAnchor { get }

    var horizontalAnchors: XAxisAnchors { get }
    var verticalAnchors: YAxisAnchors { get }
    var centerAnchors: CenterAnchors { get }
    var sizeAnchors: SizeAnchors { get }
    func anchors(_ attributes: ConstraintAttributes) -> [AnyLayoutAnchor]
    func anchor(_ attribute: ConstraintAttribute) -> AnyLayoutAnchor
}

extension NSLayoutAnchor{
    
}
extension LayoutAnchorable {
    public var edgeAnchors: EdgeAnchors {
        return  EdgeAnchors(top: topAnchor,
                            leading: leadingAnchor,
                            bottom: bottomAnchor,
                            trailing: trailingAnchor)
    }

    public func anchors(_ attributes: ConstraintAttributes) -> [NSLayoutAnchor<AnchorType>] {
        return attributes.map{anchor($0)}
    }
}

private let viewAttributesToAnchorMap: [ConstraintAttribute : (UIView) -> AnchorType] = [
    .left : { $0.leftAnchor },
    .right : { $0.rightAnchor },
    .top : { $0.topAnchor },
    .bottom : { $0.bottomAnchor },
    .leading : { $0.leadingAnchor },
    .trailing : { $0.trailingAnchor },
    .width : { $0.widthAnchor },
    .height : { $0.heightAnchor },
    .centerX : { $0.centerXAnchor },
    .centerY : { $0.centerYAnchor },
    .lastBaseline : { $0.lastBaselineAnchor },
    .firstBaseline : { $0.firstBaselineAnchor },
    .leftMargin : { $0.layoutMarginsGuide.leftAnchor },
    .rightMargin : { $0.layoutMarginsGuide.rightAnchor},
    .topMargin : { $0.layoutMarginsGuide.topAnchor },
    .bottomMargin : { $0.layoutMarginsGuide.bottomAnchor },
    .leadingMargin : { $0.layoutMarginsGuide.leadingAnchor },
    .trailingMargin : { $0.layoutMarginsGuide.trailingAnchor },
    .centerXWithinMargins : { $0.layoutMarginsGuide.centerXAnchor },
    .centerYWithinMargins : { $0.layoutMarginsGuide.centerYAnchor }
]
extension UIView: LayoutAnchorable {

    public func anchor(_ attribute: ConstraintAttribute) -> AnyLayoutAnchor{
        guard let anchor = viewAttributesToAnchorMap[attribute]?(self) as? AnyLayoutAnchor else{
            preconditionFailure(String(describing: self) + " does not support \(attribute) constraint attribute.")
        }
        return anchor
    }

    public var attributeToAnchorMap: [ConstraintAttribute : (UIView) -> AnchorType]{
        return viewAttributesToAnchorMap
    }

    public var horizontalAnchors: XAxisAnchors {
        return LayoutAnchors(leadingAnchor, trailingAnchor)
    }
    
    public var verticalAnchors: YAxisAnchors {
        return LayoutAnchors(topAnchor, bottomAnchor)
    }
    
    public var centerAnchors: CenterAnchors {
        return LayoutAnchors(centerXAnchor, centerYAnchor)
    }
    
    public var sizeAnchors: SizeAnchors {
        return LayoutAnchors(widthAnchor, heightAnchor)
    }
    
}

//private let viewControllerAttributesToAnchorMap: [ConstraintAttribute : (UIView) -> AnchorType] = [
//    .left : { $0.leftAnchor },
//    .right : { $0.rightAnchor },
//    .top : { $0.topAnchor },
//    .bottom : { $0.bottomAnchor },
//    .leading : { $0.leadingAnchor },
//    .trailing : { $0.trailingAnchor },
//    .width : { $0.widthAnchor },
//    .height : { $0.heightAnchor },
//    .centerX : { $0.centerXAnchor },
//    .centerY : { $0.centerYAnchor },
//    .lastBaseline : { $0.lastBaselineAnchor },
//    .firstBaseline : { $0.firstBaselineAnchor },
//    .leftMargin : { $0.layoutMarginsGuide.leftAnchor },
//    .rightMargin : { $0.layoutMarginsGuide.rightAnchor},
//    .topMargin : { $0.layoutMarginsGuide.topAnchor },
//    .bottomMargin : { $0.layoutMarginsGuide.bottomAnchor },
//    .leadingMargin : { $0.layoutMarginsGuide.leadingAnchor },
//    .trailingMargin : { $0.layoutMarginsGuide.trailingAnchor },
//    .centerXWithinMargins : { $0.layoutMarginsGuide.centerXAnchor },
//    .centerYWithinMargins : { $0.layoutMarginsGuide.centerYAnchor }
//]
extension UIViewController: LayoutAnchorable{
    public var leadingAnchor: XAxisAnchor {
        return view.leadingAnchor
    }

    public var trailingAnchor: XAxisAnchor {
        return view.trailingAnchor
    }

    public var leftAnchor: XAxisAnchor {
        return view.leftAnchor
    }

    public var rightAnchor: XAxisAnchor {
        return view.rightAnchor
    }

    public var topAnchor: YAxisAnchor {
        return view.topAnchor
    }

    public var bottomAnchor: YAxisAnchor {
        return view.bottomAnchor
    }


    public func anchor(_ attribute: ConstraintAttribute) -> AnyLayoutAnchor{
        guard let anchor = viewAttributesToAnchorMap[attribute]?(self.view) as? AnyLayoutAnchor else{
            preconditionFailure(String(describing: self) + " does not support \(attribute) constraint attribute.")
        }
        return anchor
    }

    
    public var horizontalAnchors: XAxisAnchors {
        return view.horizontalAnchors
    }
    
    public var verticalAnchors: YAxisAnchors {
        #if os(macOS)
        return view.verticalAnchors
        #else
        return LayoutAnchors(topLayoutGuide.bottomAnchor, bottomLayoutGuide.topAnchor)
        #endif
    }
    
    public var centerAnchors: CenterAnchors {
        return view.centerAnchors
    }
    
    public var sizeAnchors: SizeAnchors {
        return view.sizeAnchors
    }
    
}

private let layoutGuideAttributesToAnchorMap: [ConstraintAttribute : (UILayoutGuide) -> AnchorType] = [
    .left : { $0.leftAnchor },
    .right : { $0.rightAnchor },
    .top : { $0.topAnchor },
    .bottom : { $0.bottomAnchor },
    .leading : { $0.leadingAnchor },
    .trailing : { $0.trailingAnchor },
    .width : { $0.widthAnchor },
    .height : { $0.heightAnchor },
    .centerX : { $0.centerXAnchor },
    .centerY : { $0.centerYAnchor },
]
extension UILayoutGuide: LayoutAnchorable {

    public func anchor(_ attribute: ConstraintAttribute) -> AnyLayoutAnchor{
        guard let anchor = layoutGuideAttributesToAnchorMap[attribute]?(self) as? AnyLayoutAnchor else{
            preconditionFailure(String(describing: self) + " does not support \(attribute) constraint attribute.")
        }
        return anchor
    }

    public var horizontalAnchors: XAxisAnchors {
        return LayoutAnchors(leadingAnchor, trailingAnchor)
    }
    
    public var verticalAnchors: YAxisAnchors {
        return LayoutAnchors(topAnchor, bottomAnchor)
    }
    
    public var centerAnchors: CenterAnchors {
        return LayoutAnchors(centerXAnchor, centerYAnchor)
    }
    
    public var sizeAnchors: SizeAnchors {
        return LayoutAnchors(widthAnchor, heightAnchor)
    }
    
}

//// MARK: - EdgeAnchors
//
//public struct EdgeAnchors {
//    public var horizontal: XAxisAnchors
//    public var vertical: YAxisAnchors
//}

//internal extension EdgeAnchors {
//    
//}


////MARK: LayoutAnchor<LayoutDimension> == Constant
//@discardableResult
//public func == <A: LayoutAnchorable>(lhs: A, rhs: ConstraintItemAttributePair<A>) -> Constraint {
//    return LayoutRelationship(lhs.anchor(rhs.attribute), .equal, rhs.anchor).constraint
//}
//
//@discardableResult
//public func == <A: LayoutAnchorable>(lhs: A, rhs: [ConstraintItemAttributePair<A>]) -> Constraints {
//    return rhs.map{lhs == $0}
//}


//Type erased to accommodate LayoutAnchor of AnchorType aka AnyObject
public func == <A: AnchorType>(lhs: LayoutAnchor<A>, rhs: LayoutAnchor<A>) -> Constraint{
    return LayoutRelationship(lhs, .equal, rhs).constraint
}
public func == <A: AnchorType>(lhs: [LayoutAnchor<A>], rhs: [LayoutAnchor<A>]) -> Constraints{
    return lhs.enumerated().map { (arg) -> Constraint in
        let (index, element) = arg
        return element == rhs[index]
    }
}

public func == (lhs: UIView, rhs: [ViewAnchorPair]) -> Constraints{
    return lhs[rhs.map{$0.attribute}].anchors == rhs.anchors
}

extension ConstraintAttribute{
    public func of<A: LayoutConstrainable>(_ item: A) -> ConstraintItemAttributePair<A>{
        return ConstraintItemAttributePair(item: item, attribute: self)
    }

    public func anchor<A: LayoutAnchorable>(_ item: A) -> AnyLayoutAnchor{
        return item.anchor(self)
    }
}


public struct ConstraintItemAttributePair<A: LayoutConstrainable>{
    public var item: A
    public var attribute: ConstraintAttribute
}
extension ConstraintItemAttributePair where A: LayoutAnchorable{
    public var anchor: AnyLayoutAnchor{
        return item.anchor(attribute)
    }
}

//MARK: ConstraintAttributes extension
extension Array where Element == ConstraintAttribute{
    public func of<A: LayoutConstrainable>(_ item: A) -> [ConstraintItemAttributePair<A>]{
        return self.map{$0.of(item)}
    }

    public func anchors<A: LayoutAnchorable>(_ item: A) -> [AnyLayoutAnchor]{
        return item.anchors(self)
    }
}


private let anchorMap: [UIView.AnchorEnum : (UIView) -> AnchorType] = [
    .left : { $0.leftAnchor },
    .right : { $0.rightAnchor },
    .top : { $0.topAnchor },
    .bottom : { $0.bottomAnchor }
]

extension Collection where Element == ViewAnchorPair{
    public var anchors: [AnyLayoutAnchor]{
        return map{$0.anchor}
    }
}
public struct ViewAnchorPair{
    public var item: UIView
    public var attribute: UIView.AnchorEnum

    public var anchor: AnyLayoutAnchor{
        return attribute.anchor(view: item) as! AnyLayoutAnchor
    }
}
extension UIView{
    public enum AnchorEnum{
        case left
        case right
        case top
        case bottom

        public func anchor(view: UIView) -> AnchorType{
            switch self{
            case .left: return view.leftAnchor
            case .right: return view.rightAnchor
            case .top: return view.topAnchor
            case .bottom: return view.bottomAnchor
            }
        }
    }


    public func anchor(for anchorEnum: AnchorEnum) -> AnyLayoutAnchor{
        return anchorEnum.anchor(view: self) as! AnyLayoutAnchor
    }

    public subscript (attributes: [AnchorEnum]) -> [ViewAnchorPair]{
        return attributes.map{ ViewAnchorPair(item: self, attribute: $0) }
    }

    public subscript (attributes: AnchorEnum...) -> [ViewAnchorPair]{
        return self[attributes]
    }
}
