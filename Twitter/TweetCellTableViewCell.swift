//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Fung on 3/7/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    var favoried: Bool = false
    var tweetId: Int = -1
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var tweetContentLbl: UILabel!
    
   
   
    @IBOutlet weak var favBtn: UIButton!
    
    @IBOutlet weak var retweetBtn: UIButton!
    
    @IBAction func tapRetweet(_ sender: Any) {
    }
    
    @IBAction func tapFavoriteTweet(_ sender: Any) {
        let toBeFavorited = !favoried
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, faliure: { (error) in
                
            })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId,  success: {
                self.setFavorite(false)
            }, faliure: { (error) in
                
            })
        }
    }
    
    func setFavorite (_ isFavorite:Bool){
        favoried = isFavorite
        if(favoried){
            favBtn.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }else{
            favBtn.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
