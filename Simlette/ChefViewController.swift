//
//  ChefViewController.swift
//  Simlette
//
//  Created by Alisa Ono on 12/4/16.
//  Copyright © 2016 Tingxiao Sun. All rights reserved.
//

import Foundation

class ChefViewController: UIViewController {
    @IBOutlet weak var numWaiting: UILabel!
    @IBOutlet weak var orderSpecs: UILabel!

    @IBAction func buttonPressed(sender: AnyObject) {
        removeLastOrder()
        getChefView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated : Bool) {
        //Reload the view
        getChefView()
    }

    func loadChefView(objects: [OmeletteRequest]) {
        
        let numPeople = Int((objects.count))
        numWaiting.text = "there are \(numPeople) people waiting"
        
        if numPeople > 0 {
        
        let oldestOrder = objects[0]
         
        var ingredients = ""
        
        for item in ingredientsData {
            if String(oldestOrder[item]) == "1" {
                if (item == "eggwhite") {
                    ingredients += "egg white only  "
                } else {
                    ingredients += "\(item)  "
                }
            }
        }

        orderSpecs.text = ingredients

        } else {
            orderSpecs.text = "No Orders Waiting!"
            
        }
    }

    func getChefView() {
        
        let query = OmeletteRequest.query()!
        query.orderByAscending("createdAt")
        
        query.findObjectsInBackgroundWithBlock { objects, error in
            if error == nil {
                if let objects = objects as? [OmeletteRequest] {
                    self.loadChefView(objects)
                }
            } else if let error = error {
                print ("error : \(error)")
            }
        }
    }
    
    
    func removeLastOrder(){
        let query = OmeletteRequest.query()!
        query.orderByAscending("createdAt")
        query.limit = 1
        
        query.findObjectsInBackgroundWithBlock({ (objects : [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                for object in objects! {
                    object.deleteInBackground()
                }
            }
        })
    }
    
}