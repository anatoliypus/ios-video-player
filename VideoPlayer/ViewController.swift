//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Anatoliy Pushkarev on 29.06.2021.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private var videoList: UITableView!

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavParameters()
        registerTableViewCell()
        bindTableData()
        setVideoListRefreshControl()
    }
    
    //MARK: - Private properties
    
    private var viewModel = ViewModel()
    private var bag = DisposeBag()
    
    // MARK: - Public methods
    
    
    //MARK: - Private methods
    
    @objc private func refresh(sender: UIRefreshControl) {
        sender.endRefreshing()
        viewModel.addVideo()
    }
    
    private func setVideoListRefreshControl() {
        videoList.refreshControl = UIRefreshControl()
        videoList.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    private func bindTableData() {
        // binding data between viiewModel.subject and videoList
        viewModel.subject.bind(to: videoList.rx.items(cellIdentifier: VideoCell.identifier, cellType: VideoCell.self)) { row, model, cell in
            cell.setData(image: model.image, title: model.title)
        }.disposed(by: bag)
        
        // initializing data
        viewModel.initVideos()
        
        // process click on cell
        videoList.rx.modelSelected(VideoData.self).bind {video in
            let playerViewController = UIStoryboard(name: "PlayerViewController", bundle: nil).instantiateViewController(identifier: "PlayerViewController") as! PlayerViewController
            playerViewController.setData(data: video)
            self.navigationController?.pushViewController(playerViewController, animated: true)
        }.disposed(by: bag)
    }
    
    private func registerTableViewCell() {
        videoList.register(
                    VideoCell.nib,
                    forCellReuseIdentifier: VideoCell.identifier
        )
    }
    
    private func setNavParameters() {
        navigationItem.title = "Библиотека"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.backButtonTitle = " "
    }

}

