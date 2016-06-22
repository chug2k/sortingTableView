//
//  Array.swift
//  SortWeek1App
//
//  Created by Charles Lee on 6/22/16.
//  Copyright © 2016 coderschoolvn. All rights reserved.
//

import Foundation

// MARK - Array Extension
extension Array {
    func shuffle() -> Array {
        return sort({ (_, _) -> Bool in
            return arc4random() % 2 == 0
        })
    }
}