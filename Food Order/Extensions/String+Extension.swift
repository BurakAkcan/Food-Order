//
//  String+Extension.swift
//  Food Order
//
//  Created by Burak AKCAN on 23.07.2022.
//

import Foundation
extension String {
    var asUrl:URL?{
        return URL(string: self)
    }
}

extension String {
    var urlYap:URL?{
        return URL(string: self)
    }
}

