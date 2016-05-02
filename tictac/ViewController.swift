//
//  ViewController.swift
//  tictac
//
//  Created by Yeswanth varma Kanumuri on 12/18/15.
//  Copyright © 2015 Yeswanth varma Kanumuri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var gameactive = true
    
    var player = 1
    
    var gamestate = [ 0 ,0, 0, 0, 0, 0, 0, 0 ,0]
    
    let winningCombinations = [ [0,1,2] ,[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBOutlet weak var playagain: UIButton!
    @IBAction func playAgainButton(sender: AnyObject) {
        
         player = 1
        
        gamestate = [ 0 ,0, 0, 0, 0, 0, 0, 0 ,0]
        
        gameactive = true
        
        resultText.hidden = true
        
        resultText.center = CGPointMake(resultText.center.x - 500, resultText.center.y)
        
        
       // playagain.hidden = true
        
       //playagain.center = CGPointMake(playagain.center.x - 500, playagain.center.y)
        
        
        var buttontoclear : UIButton
        
        for var i = 0 ; i < 9 ; i++ {
        
        buttontoclear = view.viewWithTag(i) as! UIButton
            
            buttontoclear.setImage(nil, forState: .Normal)
        
        }
        
        
        
        
    }
    
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        
        
        
        if    (gamestate[sender.tag] == 0 && gameactive == true ){
        
        if player == 1{
        
        sender.setImage(UIImage(named: "nought 2.png"), forState: .Normal)
            player = 2
            
            gamestate[sender.tag] = 1
            
        }else
        {
        sender.setImage(UIImage(named: "cross 2.png"), forState: .Normal)
            
            
            player = 1
             gamestate[sender.tag] = 2
        
        }
            for comb in winningCombinations {
            
            
                if(gamestate[comb[0]] != 0  && gamestate[comb[0]] == gamestate[comb[1]] && gamestate[comb[1]] == gamestate[comb[2]] ){
                
                    gameactive = false
                    
              if (gamestate[comb[0]] == 1 )
              {
                
                resultText.text = "noughts have won !!"
                
                resultText.hidden = false
                
                
                
                

                
                
                
              }else{
                resultText.text = "cross have won !!"
                
                resultText.hidden = false
                
                
                

                
                
                    }
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.resultText.center = CGPointMake(self.resultText.center.x + 500, self.resultText.center.y)})
                
                }
            
            
            }
          
                
                
                }
                
                               }
            
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultText.hidden = true
        
        resultText.center = CGPointMake(resultText.center.x - 500, resultText.center.y)
        
        
     // playagain.hidden = true
        
      //  playagain.center = CGPointMake(playagain.center.x - 500, playagain.center.y)
        

        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

