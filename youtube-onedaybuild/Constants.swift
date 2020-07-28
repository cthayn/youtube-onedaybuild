//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Corey Thayn on 7/28/20.
//  Copyright © 2020 Corey Thayn. All rights reserved.
//

import Foundation

struct Constants {
  static var API_KEY = "AIzaSyBo78xoIBLD1Eh_XV39kP1trj_DmXx-vFQ"
  static var PLAYLIST_ID = "UUxw-XWa8Sj9LdtLo-uY-63A"
  static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
  
}
