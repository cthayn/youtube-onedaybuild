//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Corey Thayn on 7/27/20.
//  Copyright © 2020 Corey Thayn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
  
  
  

  
  
  @IBOutlet weak var tableView: UITableView!
  
  
  var model = Model()
  var videos = [Video]()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    
    // Set itself as the data source and the delegate
    tableView.dataSource = self
    tableView.delegate = self
    
    // Set itself as the delegate of the Model
    model.delegate = self
    
    model.getVideos()
    
    
  }
  
  // MARK: - Model Delegate Methods
  
  func videosFetched(_ videos: [Video]) {
    
    // Set the returned videos to our video property
    self.videos = videos
    
    // Refresh the table view
    tableView.reloadData()
    
  }

  
  // MARK: - TableView Methods
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    // determine the number of videos
    return videos.count
  }
  
  
  // with number of rows, this method will populate the cells
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
    
    // Configure the cells with the data
    // Get the title for the video for each cell
    let title = self.videos[indexPath.row].title
    
    cell.textLabel?.text = title
    
    // Return the cell to View Controller for displaying
    
    return cell
  
  }
  

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
  
  
}

