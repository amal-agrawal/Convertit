//
//  ViewController.swift
//  Convertit
//
//  Created by Amal Agrawal on 9/29/19.
//  Copyright © 2019 Amal Agrawal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var fromUnitsLabel: UILabel!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var formulaPicker: UIPickerView!
    
    var formulaArray = ["miles to kilometers" ,
                        "kilometers to miles",
                        "feet to meters",
                        "meters to feet",
                        "yards to meters",
                        "meters to yards"]
    
    var fromUnits = ""
    var toUnits = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formulaPicker.delegate = self
        formulaPicker.dataSource = self
    }

    @IBAction func convertButtonPressed(_ sender: Any) {
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return formulaArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return formulaArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let unitsArray = formulaArray[row].components(separatedBy: " to ")
        fromUnits = unitsArray[0]
        toUnits = unitsArray[1]  
        fromUnitsLabel.text = fromUnits
        resultsLabel.text = toUnits
    }
}
