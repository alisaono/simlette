//
//  StudentViewController.swift
//  Simlette
//
//  Created by Alisa Ono on 12/4/16.
//  Copyright © 2016 Tingxiao Sun. All rights reserved.
//

import Foundation

class StudentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var orderStatus: UILabel!
    
    var choiceOfIngredients: [String: Bool] = [
        "eggwhite": true, "spinach": true, "onions": true, "peppers":true,
        "mushrooms": true, "tomatoes": true, "broccoli":true, "ham": true,
        "cheese": true
    ]
    
    @IBAction func submitButtonPressed(sender: AnyObject) {
        let newOrder = OmeletteRequest(eggwhite: choiceOfIngredients["eggwhite"]!,
                                        spinach: choiceOfIngredients["spinach"]!,
                                        onions: choiceOfIngredients["onions"]!,
                                        peppers: choiceOfIngredients["peppers"]!,
                                        mushrooms: choiceOfIngredients["mushrooms"]!,
                                        tomatoes: choiceOfIngredients["tomatoes"]!,
                                        broccoli: choiceOfIngredients["broccoli"]!,
                                        ham: choiceOfIngredients["ham"]!,
                                        cheese: choiceOfIngredients["cheese"]!)
        newOrder.saveRequest()
        
        orderStatus.text = "Thank you! We've received your order"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderStatus.text = ""
        ingredientTableView.delegate = self
        ingredientTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9 // your number of cell here
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = ingredientTableView.dequeueReusableCellWithIdentifier("IngredientCell", forIndexPath: indexPath) as! IngredientsTableViewCell
        
        let name = ingredientsData[indexPath.row]
        if name == "eggwhite" {
            cell.ingredientName?.text = "egg white only"
        } else {
            cell.ingredientName?.text = name
        }
        
        cell.ingredientSwitch?.tag = indexPath.row
        
        cell.ingredientSwitch?.addTarget(self, action: #selector(self.switchChanged), forControlEvents: .ValueChanged)
        
        return cell
        
    }

    func switchChanged(sender: AnyObject)
    {
        let switchControl: UISwitch = sender as! UISwitch
        let selectedIngredient = ingredientsData[switchControl.tag]
        
        if switchControl.on {
            choiceOfIngredients[selectedIngredient] = true
        } else {
            choiceOfIngredients[selectedIngredient] = false
        }
        
    }
    
}