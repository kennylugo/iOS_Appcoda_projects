//
//  Trip.swift
//  TripCard
//
//  Created by Kenny Batista on 1/3/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import Foundation
import UIKit

struct Trip {
    var tripId = ""
    var city = ""
    var country = ""
    var featuredImage: UIImage?
    var price: Int = 0
    var totalDays: Int = 0
    var isLiked = false
    
    init(tripId: String, city: String, country: String, featuredImage: UIImage!, price: Int, totalDays: Int, isLiked: Bool){
        self.tripId = tripId
        self.city = city
        self.country = country
        self.featuredImage = featuredImage
        self.price = price
        self.totalDays = totalDays
        self.isLiked = isLiked
    }
}

