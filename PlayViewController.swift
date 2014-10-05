//
//  PlayViewController.swift
//  Chasing Pavements
//
//  Created by Muhd Hizam on 4/10/14.
//  Copyright (c) 2014 PRIxDE Agency. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    /* List of IBOutlets */
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var ground: UIImageView!
    @IBOutlet weak var player: UIImageView!
    
    
    /* List of IBActions */
    @IBAction func pauseAction(sender: UIButton) {
    }
    
    @IBAction func exitAction(sender: UIButton) {
    }
    
    @IBAction func gameStart(sender: UIButton) {
        
        pauseButton.hidden = false;
        exitButton.hidden = false;
        startGameButton.hidden = true;
        ground.hidden = false;
        
        //Let the ground move
        self.repositionGround()
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("groundMovement"), userInfo: nil, repeats: true)
        
        //Animate player running
        player.animationImages = [
            
            UIImage(named: "Running1.png"),
            UIImage(named: "Running2.png")
        ]
        
        player.animationDuration = 0.5
        player.startAnimating()
    }
    
    
    /* List of functions */
    override func viewDidLoad() {
        
        pauseButton.hidden = false
        exitButton.hidden = false
        startGameButton.hidden = false
        ground.hidden = false
        
        super.viewDidLoad()
        player.animationImages = [
        
        UIImage(named: "Standing1.png"),
        UIImage(named: "Standing2.png")
        ]
        
        player.animationDuration = 1
        player.startAnimating()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func groundMovement() {
        ground.center = CGPointMake(ground.center.x - 7, ground.center.y)
        
        if (ground.center.x < 280) {
            self.repositionGround()
        }
    }
    
    func repositionGround() {
        ground.center = CGPointMake(390, 342)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
