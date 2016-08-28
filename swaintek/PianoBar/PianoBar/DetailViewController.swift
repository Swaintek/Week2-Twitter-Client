//
//  DetailViewController.swift
//  PianoBar
//
//  Created by David Swaintek on 6/16/16.
//  Copyright © 2016 David Swaintek. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, Identity {
    // MARK: Properties

    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    var cache : Cache<UIImage>? {
        if let delegate = UIApplication.sharedApplication().delegate as? AppDelegate{
            return delegate.cache
        }
        return nil
    }
    
    var tweet: Tweet?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let tweet = self.tweet {
//            if let retweet = tweet.retweet {
//                self.tweetLabel.text = retweet.text
//                self.userLabel.text = retweet.user?.name
//            } else {
//                self.tweetLabel.text = tweet.text
//                self.userLabel.text = tweet.user?.name
//            }
//        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == UserTimelineViewController.id(){
            
            let userTimelineViewController = segue.destinationViewController as! UserTimelineViewController
            
            userTimelineViewController.tweet = self.tweet
            
        }
    }
    
    func setup(){
        if let tweet = self.tweet, user = tweet.user{
            if let originalTweet = tweet.retweet, originalUser = originalTweet.user{
                self.navigationItem.title = "Retweet"
                self.tweetLabel.text = originalTweet.text
                self.userLabel.text = originalUser.name
                
                self.profileImage(originalUser.profileImgUrl, completion: { (image) in
                    
                    self.profileImageView.image = image
                    
                })
            }
            else {
                self.navigationItem.title = "Tweet"
                self.tweetLabel.text = tweet.text
                self.userLabel.text = user.name
                
                self.profileImage(user.profileImgUrl, completion: { (image) in
                    self.profileImageView.image = image
                })
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func profileImage(key: String, completion: (image: UIImage) -> ()){
        if let image = cache?.read(key){
            completion(image: image)
            return
        }
        
        API.shared.getImage(key) { (image) in
            self.cache?.write(image, key: key)
            completion(image: image)
            return
        }
    }
}
