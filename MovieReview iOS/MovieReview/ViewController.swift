//
//  ViewController.swift
//  MovieReview
//
//  Created by Akshay Anand on 21/07/20.
//  Copyright © 2020 Akshay Anand. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var ratings: UISlider!
    @IBOutlet weak var ratingsLabel: UILabel!
    
    @IBOutlet weak var movieTitle: UITextField!
    
    @IBOutlet weak var movieReview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUserActivity()
        movieReview.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textViewDidChange(_ textView: UITextView) {
        userActivity?.needsSave = true
        print("text view changed")
    }
    
    @IBAction func movieTitleChanged(_ sender: Any) {
        userActivity?.needsSave = true
        print("text field changed")

    }
    func createUserActivity() {
        let activity = NSUserActivity(activityType: "com.akshay.movieReview.createReview")
        activity.title = "Creating review"
        var reviewDictionary : [AnyHashable: Any]? = [:]
        
        reviewDictionary?["title"] = movieTitle.text
        reviewDictionary?["reviewText"] = movieReview.text
        reviewDictionary?["rating"] = ratings.value
        activity.userInfo = reviewDictionary
        self.userActivity = activity
        self.userActivity?.becomeCurrent()
        
    }
    
    override func updateUserActivityState(_ activity: NSUserActivity) {
        var reviewDictionary : [AnyHashable: Any] = [:]
        
        reviewDictionary["title"] = movieTitle.text
        reviewDictionary["reviewText"] = movieReview.text
        reviewDictionary["rating"] = ratings.value
        activity.addUserInfoEntries(from: reviewDictionary)
        print("Asked for an update")
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        let roundedRating = String(format: "%.1f", sender.value)
        ratingsLabel.text = "Rating: \(roundedRating)"
        userActivity?.needsSave = true
    }
    
}

