//wentai,cui 01/15/2016

import Foundation

class TipCalc {
    
    var tipAmount: Float = 0
    var amountBeforeTax: Float = 0
    var tipPercentage: Float = 0
    var totalAmount: Float = 0
    
    init(amountBeforeTax: Float, tipPercentage: Float) {
        self.amountBeforeTax = amountBeforeTax;
        self.tipPercentage = tipPercentage
    }
    
    func calculateTip() {
        tipAmount = amountBeforeTax * tipPercentage/100
        totalAmount = tipAmount + amountBeforeTax
    }
    
}