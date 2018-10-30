//
//  Item.swift
//  Todoey
//
//  Created by 中尾 佳代 on 2018/10/23.
//  Copyright © 2018 KayoNakao. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title = ""
    @objc dynamic var done = false
    @objc dynamic var dateCreated:Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
