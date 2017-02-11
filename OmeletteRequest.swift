//
//  OmeletteRequest.swift
//  Simlette
//
//  Created by Alisa Ono on 12/4/16.
//  Copyright © 2016 Tingxiao Sun. All rights reserved.
//

import Foundation

class OmeletteRequest: PFObject {
    @NSManaged var eggwhite: Bool
    @NSManaged var spinach: Bool
    @NSManaged var onions: Bool
    @NSManaged var peppers: Bool
    @NSManaged var mushrooms: Bool
    @NSManaged var tomatoes: Bool
    @NSManaged var broccoli: Bool
    @NSManaged var ham: Bool
    @NSManaged var cheese: Bool
    
    init(eggwhite: Bool, spinach: Bool, onions: Bool, peppers: Bool, mushrooms: Bool, tomatoes: Bool,
         broccoli: Bool, ham: Bool, cheese: Bool) {
        super.init()
        
        self.eggwhite = eggwhite
        self.spinach = spinach
        self.onions = onions
        self.peppers = peppers
        self.mushrooms = mushrooms
        self.tomatoes = tomatoes
        self.broccoli = broccoli
        self.ham = ham
        self.cheese = cheese
    }
    
    override init() {
        super.init()
    }
    
    override class func query() -> PFQuery? {
        let query = PFQuery(className: OmeletteRequest.parseClassName())
        query.orderByAscending("createdAt")
        return query
    }
    
    func saveRequest() {
        self.saveInBackgroundWithBlock{ succeeded, error in
            if succeeded {
                print("saved")
            } else {
                print("error: \(error)")
            }
        }
    }
}

extension OmeletteRequest: PFSubclassing {
    // Table view delegate methods here
    //1
    class func parseClassName() -> String {
        return "Order"
    }
    
    //2
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
}
