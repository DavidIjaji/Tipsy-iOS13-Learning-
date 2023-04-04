//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by David Alejandro Ijaji Guerrero on 2/04/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var result:Float?
    var people:Int?
    var tip:Int?

    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var resumeText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(result != nil && people != nil && tip != nil){
            resultText.text = String(result!
            )
            resumeText.text = "Split between \(people!) people, with \(tip!)% tip."
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculateAction(_ sender: UIButton) {
        self.dismiss(animated: true)
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
