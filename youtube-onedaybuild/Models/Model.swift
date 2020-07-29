//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Corey Thayn on 7/28/20.
//  Copyright © 2020 Corey Thayn. All rights reserved.
//

import Foundation

// Create custom protocol for ModelDelegate
protocol ModelDelegate {
  func videosFetched(_ videos:[Video])
  }

// Create Model class
class Model {
  
  // declare that the delegate must conform to custom protocol
  var delegate:ModelDelegate?


  func  getVideos() {
    
    // Create a URL object
    let url = URL(string: Constants.API_URL)
    
    guard url != nil else {
      return
    }
    
    // Get a URLSession object
    let session = URLSession.shared
    
    // Get a data task from the URLSession object
    let dataTask = session.dataTask(with: url!) { (data, response, error) in
      
      // Check if there were any errors
      if error != nil || data == nil {
        return
      }
      
      do {
        
        // Parsing the data into video objects
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        // decode response from data
        let response = try decoder.decode(Response.self, from: data!)
      
        // if response is not nil
        if response.items != nil {
        
          // place the update of the video list in the main thread, this is needed so the videoFetch func is not running in the background thread (performace issue)
          DispatchQueue.main.sync {
              
            // Call the "videosFetched" method of the delegate
              self.delegate?.videosFetched(response.items!)
          }

        }
        
 //       dump(response)
      }
      
        // if error
      catch {
        
      }
      
    }
    
    // Kick off the task
    dataTask.resume()
    
  }
}
