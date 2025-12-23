//
//  User.swift
//  Users_SwiftUI_combine
//
//  Created by Karthik Solleti on 23/12/25.
//


import Foundation
import SwiftUI

struct User: Hashable, Identifiable, Decodable {
    var id: Int64
    var login: String
    var avatar_url: URL
}
