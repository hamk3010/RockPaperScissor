//
//  ViewController.swift
//  roshambo
//
//  Created by Hamza Khan on 1/30/19.
//  Copyright © 2019 Hamza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction private func playRock(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Result") as! Result
        vc.userChoice = getUserShape(sender)
        present(vc, animated: true, completion: nil)
    }

    
    @IBAction private func playPaper(_ sender: UIButton){
        performSegue(withIdentifier: "play" , sender: sender)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "play"){
            
            let vc = segue.destination as! Result
            vc.userChoice = getUserShape(sender as! UIButton)
        }
    }
    
    private func getUserShape(_ sender: UIButton) -> Shape {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.title(for: UIControl.State())!
        return Shape(rawValue: shape)!
    }

}

