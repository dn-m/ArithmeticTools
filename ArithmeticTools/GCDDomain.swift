//
//  GCDDomain.swift
//  ArithmeticTools
//
//  Created by James Bean on 2/12/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import Darwin

/// - returns: Greatest common divisor of `a` and `b`.
public func gcd <I: Integer> (_ a: I, _ b: I) -> I {
    let result = a % b
    return result == 0 ? b : gcd(b, result)
}

/// - returns: Least common multiple of `a` and `b`.
public func lcm <I: Integer> (_ a: I, _ b: I) -> I {
    return (a / gcd(a,b)) * b
}

extension Sequence where Iterator.Element: Integer {

    /// Greatest common divisor of elements in Sequence.
    ///
    ///     `[8,12].gcd -> 4`
    ///
    public var gcd: Iterator.Element {
        return reduce(0, ArithmeticTools.gcd)
    }

    /// Least common multiple of elements in Sequence.
    ///
    ///     `[4,5,6].lcm -> 60`
    ///
    public var lcm: Iterator.Element {
        return reduce(1, ArithmeticTools.lcm)
    }
}
