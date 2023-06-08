//
//  URL+Extension.swift
//  JoshLytleResume
//
//  Created by Joshua Lytle on 6/7/23.
//

import Foundation

extension URL: Identifiable {
    public var id: String { self.absoluteString }
}
