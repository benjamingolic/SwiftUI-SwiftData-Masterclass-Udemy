//
//  PageModel.swift
//  Pinch
//
//  Created by Benjamin Golic on 19.10.24.
//

import Foundation

struct Page: Identifiable {
  let id: Int
  let imageName: String
}

extension Page {
  var thumbName: String {
    return "thumb-" + imageName
  }
}
