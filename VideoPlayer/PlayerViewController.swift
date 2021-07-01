//
//  PlayerViewController.swift
//  VideoPlayer
//
//  Created by Anatoliy Pushkarev on 30.06.2021.
//

import UIKit

class PlayerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    //MARK: - IBOutlets

    @IBOutlet private var topicCollection: UICollectionView!
    @IBOutlet private var videoImage: UIImageView!
    @IBOutlet var videoTitle: UILabel!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavParameters()
        setTopicCollectionProperties()
        registerTableViewCell()
        setUIElementsData()
    }
    
    //MARK: - Private properties
    
    private var video: VideoData?

    
    //MARK: - Public methods
    
    func setData(data: VideoData) {
        video = data
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = topicCollection.dequeueReusableCell(withReuseIdentifier: TopicCellCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
    //MARK: - Private methods
    
    private func registerTableViewCell() {
        topicCollection.register(
                    TopicCellCollectionViewCell.nib,
            forCellWithReuseIdentifier: TopicCellCollectionViewCell.identifier
        )
    }
    
    private func setTopicCollectionProperties() {
        topicCollection.dataSource = self
        topicCollection.delegate = self
    }
    
    private func setNavParameters() {
        navigationItem.title = ""
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = UIColor.orange
    }
    
    private func setUIElementsData() {
        videoTitle.text = video?.title
        videoImage.image = video?.image
    }
    
    //MARK: - IBActions
    
    @IBAction func playVideoAction(_ sender: UIButton) {
        print("should play video")
    }

}
