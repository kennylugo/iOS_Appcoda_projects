//
//  TripViewController.swift
//  TripCard
//
//  Created by Simon Ng on 8/11/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class TripViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, TripCollectionViewCellDelegate {
    
    // Collection View
    @IBOutlet var collectionView: UICollectionView!
    

    @IBOutlet var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Apply blurring effect
        backgroundImageView.image = UIImage(named: "cloud")
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        
        print(trips)
        
    }
    
    func didLikeButtonPressed(cell: TripCollectionViewCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            trips[indexPath.row].isLiked = trips[indexPath.row].isLiked ? false : true
            cell.isLiked = trips[indexPath.row].isLiked
        }
    }
    
    
    
    
    private var trips = [Trip(tripId: "Paris001", city: "Paris", country: "France",
                              featuredImage: UIImage(named: "paris"), price: 2000, totalDays: 5, isLiked:false),
                         Trip(tripId: "Rome001", city: "Rome", country: "Italy", featuredImage:
                            UIImage(named: "rome"), price: 800, totalDays: 3, isLiked: false),
                         Trip(tripId: "Istanbul001", city: "Istanbul", country: "Turkey",
                              featuredImage: UIImage(named: "istanbul"), price: 2200, totalDays: 10, isLiked:
                            false),
                         Trip(tripId: "London001", city: "London", country: "United Kingdom",
                              featuredImage: UIImage(named: "london"), price: 3000, totalDays: 4, isLiked:
                            false),
                         Trip(tripId: "Sydney001", city: "Sydney", country: "Australia",
                              featuredImage: UIImage(named: "sydney"), price: 2500, totalDays: 8, isLiked:
                            false),
                         Trip(tripId: "Santorini001", city: "Santorini", country: "Greece",
                              featuredImage: UIImage(named: "santorini"), price: 1800, totalDays: 7, isLiked:
                            false),
                         Trip(tripId: "NewYork001", city: "New York", country: "United States",
                              featuredImage: UIImage(named: "newyork"), price: 900, totalDays: 3, isLiked:
                            false),
                         Trip(tripId: "Kyoto001", city: "Kyoto", country: "Japan", featuredImage:
                            UIImage(named: "kyoto"), price: 1000, totalDays: 5, isLiked: false)
    ]

    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // create the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TripCollectionViewCell
        
        // customize the cell
        cell.cityLabel.text = trips[indexPath.row].city
        cell.countryLabel.text = trips[indexPath.row].country
        cell.imageView.image = trips[indexPath.row].featuredImage
        cell.daysLabel.text = String(trips[indexPath.row].totalDays)
        cell.priceLabel.text = "$\(trips[indexPath.row].price)"
        cell.isLiked = trips[indexPath.row].isLiked
        
        cell.layer.cornerRadius = 4.0
        
        // Mark ourselves as the receiver
        cell.delegate = self
        
        return cell
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
