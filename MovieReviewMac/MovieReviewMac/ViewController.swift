//
//  ViewController.swift
//  MovieReviewMac
//
//  Created by Akshay Anand on 25/07/20.
//  Copyright © 2020 Akshay Anand. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var ratingLabel: NSTextField!
    @IBOutlet weak var movieRating: NSSlider!
    @IBOutlet weak var movieReview: NSTextField!
    @IBOutlet weak var movieTitle: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func restoreUserActivityState(_ userActivity: NSUserActivity) {
        if let title = userActivity.userInfo?["title"] as? String {
            movieTitle.stringValue = title
        }
        if let review = userActivity.userInfo?["reviewText"] as? String {
            movieReview.stringValue = review
        }
        if let rating = userActivity.userInfo?["rating"] as? Float {
            movieRating.floatValue  = rating
            let roundedRating = String(format: "%.1f", rating)
            ratingLabel.stringValue = "Rating - \(roundedRating)"
        }
    }

}

