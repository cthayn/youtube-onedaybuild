//
//  CacheManager.swift
//  youtube-onedaybuild
//
//  Created by Corey Thayn on 7/29/20.
//  Copyright © 2020 Corey Thayn. All rights reserved.
//

import Foundation

class CacheManager  {
  
  static var cache = [String:Data]()
  
  static func setVideoCache(_ url:String, _ data:Data?) {
    
    // Save image data to the cache and use url as key
    cache[url] = data
    
  }
  
  static func getVideoCache(_ url:String) -> Data? {
    
    // Try to get the data for the specified url
    return cache[url]
  }
}
