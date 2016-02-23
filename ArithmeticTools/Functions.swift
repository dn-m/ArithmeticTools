//
//  Functions.swift
//  ArithmeticTools
//
//  Created by James Bean on 2/16/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

public func greatestCommonDivisor<T: ArithmeticType>(a: T, _ b: T) -> T {
    if b == T.zero() { return a }
    return greatestCommonDivisor(b, T.mod(a,b))
}