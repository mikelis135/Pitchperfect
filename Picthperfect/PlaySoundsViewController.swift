//
//  PlaySoundsViewController.swift
//  Picthperfect
//
//  Created by Taiwo Adebayo on 04/10/2019.
//  Copyright © 2019 Taiwo Adebayo. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton : UIButton!
    var audioRecorded : URL!

    override func viewDidLoad() {
          print("in playing page")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func stopSound(_ sender: Any) {
         print("stop Sound")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
