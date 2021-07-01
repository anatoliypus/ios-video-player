//
//  ViewModel.swift
//  VideoPlayer
//
//  Created by Anatoliy Pushkarev on 30.06.2021.
//

import UIKit
import RxSwift
import RxCocoa

class ViewModel {
    
    //MARK: - Public properties
    
    var videos = [VideoData(image: #imageLiteral(resourceName: "7285"), title: "My title 1"),
                  VideoData(image: #imageLiteral(resourceName: "7285"), title: "My title 2"),
                  VideoData(image: #imageLiteral(resourceName: "7285"), title: "My title 3"),
                  VideoData(image: #imageLiteral(resourceName: "7285"), title: "My title 4"),
                  VideoData(image: #imageLiteral(resourceName: "7285"), title: "My title 5")]
    
    var subject = PublishSubject<[VideoData]>()
    
    //MARK: - Public methods
    
    func initVideos() {
        subject.onNext(videos)
    }
    
    func addVideo() {
        videos.append(VideoData(image: #imageLiteral(resourceName: "7285"), title: "New video"))
        subject.onNext(videos)
    }
}
