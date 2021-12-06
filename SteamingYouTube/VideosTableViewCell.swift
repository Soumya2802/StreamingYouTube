//
//  VideosTableViewCell.swift
//  SteamingYouTube
//
//  Created by Soumya Ammu on 12/3/21.
//

import UIKit
import YouTubeiOSPlayerHelper

class VideosTableViewCell: UITableViewCell {

    @IBOutlet var playerView: YTPlayerView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
