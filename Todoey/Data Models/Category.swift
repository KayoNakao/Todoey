 //
//  Category.swift
//  Todoey
//
//  Created by 中尾 佳代 on 2018/10/23.
//  Copyright © 2018 KayoNakao. All rights reserved.
//

import Foundation
import RealmSwift
 
 class Category: Object {
    @objc dynamic var name = ""
    let items = List<Item>()
 }
