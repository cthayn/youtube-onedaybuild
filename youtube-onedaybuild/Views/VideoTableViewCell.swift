//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Corey Thayn on 7/29/20.
//  Copyright © 2020 Corey Thayn. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

  @IBOutlet weak var thumbnailImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  
  var video:Video?
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func setCell(_ v:Video) {
    
    self.video = v
    
    guard self.video != nil else {
      return
    }
    
    // Set the title and date label
    self.titleLabel.text = video?.title
    
    // Set date
    let df = DateFormatter()
    df.dateFormat = "EEEE, MMM d, yyyy"
    self.dateLabel.text = df.string(from: video!.published)
    
    // Set thumbnail
    guard self.video?.thumbnail != ""  else {
      return
    }
    
    // Check cache before downloading data
    
    if let cacheData = CacheManager.getVideoCache(self.video!.thumbnail) {
      
      // Set the thumbnail image view
      self.thumbnailImageView.image = UIImage(data: cacheData)
      return
    }
    
    // Download the thumbnail data
    let url = URL(string: self.video!.thumbnail)
    
    // Get the sahred URL session
    let session = URLSession.shared
    
    // Create data task
    let dataTask = session.dataTask(with: url!) { (data, response, error) in
      
      if error == nil && data != nil {
        
        // Save the data in the cache
        CacheManager.setVideoCache(url!.absoluteString, data!)
        
        // Check that the downloaded url mathces the video thumbnail url that this cell is currently set to display
        if url!.absoluteString != self.video?.thumbnail {
          // Video cell has been recycled for another video and no longer matches hte thumbnail that was downloaded
          
          return
        }
        
        
        //Create the image object
        let image = UIImage(data: data!)
        
        // Set the image view
        DispatchQueue.main.sync {
          self.thumbnailImageView.image = image
          
        }
      
      }
      
    }
    
  // Start the data task
    dataTask.resume()
  }
  
  
  
}
