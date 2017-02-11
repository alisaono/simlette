//
//  ViewController.swift
//  Simlette
//
//  Created by Tingxiao Sun on 12/3/16.
//  Copyright © 2016 Tingxiao Sun. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "opening.jpg")!)/*, imageView.center = CGPointMake(self.view.center.x,self.yourView.center.y) (image drawInRect:CGRectMake((self.view.frame.size.width/2) - (image.size.width/2),
            (self.view.frame.size.height / 2) - (image.size.height / 2),
            image.size.width,
            image.size.height))*/
        //self.myImageView setFrame:self.view.bounds
        //UIView* myView=[[UIView alloc] initWithFrame:viewRect];
            //.center = self.view.center;
        //self.navigationController?.isNavigationBarHidden = true
        //@property(nonatomic, getter=isNavigationBarHidden) BOOL navigationBarHidden

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

