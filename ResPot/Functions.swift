//
//  Functions.swift
//  ResPot
//
//  Created by joe_mac on 01/02/2021.
//  Copyright © 2021 Joe K. All rights reserved.
//

import Foundation

let applicationDocumentsDirectory: URL = {
    let paths = FileManager.default.urls(for: .documentDirectory,
                                         in: .userDomainMask)
    return paths[0]
}()
