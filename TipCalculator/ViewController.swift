//wentai,cui 1/15/2016

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var peopleTextField: UITextField!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var eachPersonAmountLabel: UILabel!
    var tipPer = [18,20,22]
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let tipCalc = TipCalc(amountBeforeTax: 0.00, tipPercentage: 0)
    //used to store the textField
    var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        amountBeforeTaxTextField.text = String(format: "%0.2f", arguments:[tipCalc.amountBeforeTax])
        // tipTextField.text = String(format: "%d", arguments:[tipPer[tipControl.selectedSegmentIndex]])
        
        tipTextField.text = String(format: "%d", arguments:[tipCalc.tipPercentage])
       
        
        eachPersonAmountLabel.text = String(format:"Each: $%0.2f", arguments:[(tipCalc.totalAmount / numberOfPeopleSlider.value)])
        numberOfPeopleLabel.text = "people: \(Int(numberOfPeopleSlider.value))"
      
        textFields = [amountBeforeTaxTextField]
    }
    
    func calcTip() {
       
        
        tipCalc.tipPercentage = ((tipTextField.text)! as NSString).floatValue
        tipCalc.amountBeforeTax = ((amountBeforeTaxTextField.text)! as NSString).floatValue
        tipCalc.calculateTip()
        updateUI()
    }
    
    func updateUI() {
         let numOfPeople: Int = Int(numberOfPeopleSlider.value);
        resultLabel.text = String(format:"Total: $%0.2f   Tip: $%0.2f", arguments:[((tipCalc.amountBeforeTax / Float(numOfPeople))*(tipCalc.tipPercentage / 100)+tipCalc.amountBeforeTax/Float(numOfPeople)), (tipCalc.amountBeforeTax / Float(numOfPeople))*(tipCalc.tipPercentage / 100)])
       
        eachPersonAmountLabel.text = String(format: "Each: %0.2f", arguments: [tipCalc.amountBeforeTax/Float(numOfPeople)])
    }
    
    @IBAction func tipSliderValueChanged(sender: AnyObject) {
        
        
        tipPercentageLabel.text! = String(format: "Tip: %02d%%", arguments: [Int(tipCalc.tipPercentage)])
        calcTip()
    }
    
    @IBAction func numberOfPeopleSliderChanged(sender: AnyObject) {
        numberOfPeopleLabel.text = "people: \(Int(numberOfPeopleSlider.value))"
        updateUI()
    }
    
    
    @IBAction func amountBeforeTaxTextFieldChanged(sender: AnyObject) {
        calcTip()
    }
    
    @IBAction func amountTipTextFieldChanged(sender: AnyObject) {
        tipTextField.text = String(format: "%d", arguments:[tipPer[tipControl.selectedSegmentIndex]])
        calcTip()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let textFieldsArray = textFields as NSArray
        let i = textFieldsArray.indexOfObject(textField)
        if i < textFieldsArray.count - 1 {
         
            let nextTextField = textFieldsArray[i+1] as! UITextField
     
            nextTextField.becomeFirstResponder()
        } else {
        
            textField.resignFirstResponder()
            // do the caculator
            calcTip()
        }
        return true;  }
}






























