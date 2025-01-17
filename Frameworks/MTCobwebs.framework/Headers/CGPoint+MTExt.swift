//
//  CGPoint+MTExt.swift
//
//  Copyright © 2016-2018年 Mantis Group. All rights reserved.
//

#if os(macOS)
    import Cocoa
#else
    import UIKit
#endif

// MARK: - Methods
public extension CGPoint {
    
    /// Distance from another CGPoint.
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     let distance = point1.distance(from: point2)
    ///     //distance = 28.28
    ///
    /// - Parameter point: CGPoint to get distance from.
    /// - Returns: Distance between self and given CGPoint.
    public func distance(from point: CGPoint) -> CGFloat {
        return CGPoint.distance(from: self, to: point)
    }
    
    /// Distance between two CGPoints.
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     let distance = CGPoint.distance(from: point2, to: point1)
    ///     //Distance = 28.28
    ///
    /// - Parameters:
    ///   - point1: first CGPoint.
    ///   - point2: second CGPoint.
    /// - Returns: distance between the two given CGPoints.
    public static func distance(from point1: CGPoint, to point2: CGPoint) -> CGFloat {
        // http://stackoverflow.com/questions/6416101/calculate-the-distance-between-two-cgpoints
        return sqrt(pow(point2.x - point1.x, 2) + pow(point2.y - point1.y, 2))
    }
    
}

// MARK: - Operators
public extension CGPoint {
    
    /// Add two CGPoints.
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     let point = point1 + point2
    ///     //point = CGPoint(x: 40, y: 40)
    ///
    /// - Parameters:
    ///   - lhs: CGPoint to add to.
    ///   - rhs: CGPoint to add.
    /// - Returns: result of addition of the two given CGPoints.
    public static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    /// Add a CGPoints to self.
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     point1 += point2
    ///     //point1 = CGPoint(x: 40, y: 40)
    ///
    /// - Parameters:
    ///   - lhs: self
    ///   - rhs: CGPoint to add.
    public static func += (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs + rhs
    }
    
    /// Subtract two CGPoints.
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     let point = point1 - point2
    ///     //point = CGPoint(x: -20, y: -20)
    ///
    /// - Parameters:
    ///   - lhs: CGPoint to subtract from.
    ///   - rhs: CGPoint to subtract.
    /// - Returns: result of subtract of the two given CGPoints.
    public static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    /// Subtract a CGPoints from self.
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     point1 -= point2
    ///     //point1 = CGPoint(x: -20, y: -20)
    ///
    /// - Parameters:
    ///   - lhs: self
    ///   - rhs: CGPoint to subtract.
    public static func -= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs - rhs
    }
    
    /// Multiply a CGPoint with a scalar
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let scalar = point1 * 5
    ///     //scalar = CGPoint(x: 50, y: 50)
    ///
    /// - Parameters:
    ///   - point: CGPoint to multiply.
    ///   - scalar: scalar value.
    /// - Returns: result of multiplication of the given CGPoint with the scalar.
    public static func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: point.x * scalar, y: point.y * scalar)
    }
    
    /// Multiply self with a scalar
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     point *= 5
    ///     //point1 = CGPoint(x: 50, y: 50)
    ///
    /// - Parameters:
    ///   - point: self.
    ///   - scalar: scalar value.
    /// - Returns: result of multiplication of the given CGPoint with the scalar.
    public static func *= (point: inout CGPoint, scalar: CGFloat) {
        point = point * scalar
    }
    
    /// Multiply a CGPoint with a scalar
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let scalar = 5 * point1
    ///     //scalar = CGPoint(x: 50, y: 50)
    ///
    /// - Parameters:
    ///   - scalar: scalar value.
    ///   - point: CGPoint to multiply.
    /// - Returns: result of multiplication of the given CGPoint with the scalar.
    public static func * (scalar: CGFloat, point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x * scalar, y: point.y * scalar)
    }
    
}


public extension CGPoint {
    
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    
    
    /// 初始化
    ///
    /// - Parameter value: 格式化字符串  如： "25,25"
    public init(stringLiteral value: StringLiteralType) {
        self.init()
        
        let point: CGPoint
        if value[value.startIndex] != "{" {
            point = NSCoder.cgPoint(for: "{\(value)}")
        } else {
            point = NSCoder.cgPoint(for: value)
        }
        self.x = point.x
        self.y = point.y
    }
    
    /// init `self.init(stringLiteral: value)`
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    /// init `self.init(stringLiteral: value)`
    public typealias UnicodeScalarLiteralType = StringLiteralType
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: value)
    }
}

