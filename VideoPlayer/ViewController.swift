//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Anatoliy Pushkarev on 29.06.2021.
//

import UIKit

struct videoData {
    let image : UIImage!
    let title: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - IBOutlets
    @IBOutlet private var videoList: UITableView!
    
    
    
    // MARK: - Public properties
    
    
    
    // MARK: - Private Properties
    
    private let videos = [videoData(image: #imageLiteral(resourceName: "7285"), title: "My title 1"),
                          videoData(image: #imageLiteral(resourceName: "7285"), title: "My title 2"),
                          videoData(image: #imageLiteral(resourceName: "7285"), title: "My title 3"),]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        videoList.dataSource = self
        videoList.delegate = self
        // Do any additional setup after loading the view.
        videoList.register(
                    VideoCell.nib,
                    forCellReuseIdentifier: VideoCell.identifier
        )
    }
    
    
    // MARK: - Public methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideoCell.identifier, for: indexPath) as! VideoCell
        cell.setData(image: videos[indexPath.row].image, title: videos[indexPath.row].title)
        return cell
    }
    
    // MARK: - Private methods

}

