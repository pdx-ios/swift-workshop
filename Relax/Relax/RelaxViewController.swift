//
//  RelaxViewController.swift
//  Relax
//
//  Created by Ryan Arana on 2/7/15.
//  Copyright (c) 2015 PDX-iOS. All rights reserved.
//

import UIKit

class RelaxViewController: UIViewController {

    @IBOutlet weak var activityTitleLabel: UILabel!

    var allActivities = [Activity]()
    var currentActivityIndex: Int = 0 {
        didSet {
            if self.currentActivityIndex >= allActivities.count {
                self.currentActivityIndex = 0
                return
            }
            if activityTitleLabel != nil {
                activityTitleLabel.text = allActivities[self.currentActivityIndex].title
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        allActivities = DataStore.loadActivities()
        nextActivity()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextActivity() {
        self.currentActivityIndex = Int(arc4random_uniform(UInt32(allActivities.count)))
    }

    @IBAction func beginActivity() {
        DataStore.setCurrentActivity(allActivities[currentActivityIndex])

        // TODO: Implement me!
        println( "beginActivity called... but it's not implemented yet!")
    }
}

