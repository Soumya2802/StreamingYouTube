//
//  ViewController.swift
//  SteamingYouTube
//
//  Created by Soumya Ammu on 12/2/21.
//

import UIKit
import YouTubeiOSPlayerHelper

class ViewController: UIViewController,YTPlayerViewDelegate,UITableViewDataSource, UITableViewDelegate {

   
    
    var tableData = [String]()
    
    @IBOutlet weak var videosTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //videosTableView.reloadData()
        //self.videosTableView.register(VideosTableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
        //API request
        videosTableView.register(UINib(nibName: "VideosTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
       
        //videoPlayer.load(withVideoId: videoID)
        //videoPlayer.load(withVideoId: videoID, playerVars: ["playsinline":1])
        
        //videoPlayer.playVideo()
    }

    override func viewWillAppear(_ animated: Bool) {
        let apiCalls = APICalls()
        tableData = apiCalls.HTTP_Request()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? VideosTableViewCell
        let videoid = tableData[indexPath.row]
        //cell?.playerView.load(withVideoId: "PLXWBBaEdFtbIZHCQzSgYekEKyWZ1hdbVd", playerVars: ["playsinline":1])90
        //cell?.playerView = YTPlayerView()
        cell?.playerView.load(withVideoId: "PLXWBBaEdFtbIZHCQzSgYekEKyWZ1hdbVd")
        
        cell?.playerView.playVideo()
        //cell?.playerView.backgroundColor = .black
        
    
        return cell ?? UITableViewCell()
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}

