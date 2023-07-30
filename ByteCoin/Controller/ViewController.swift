//
//  ViewController.swift
//  ByteCoin
//
//  Created by Ahmed Alaa on 30/05/2023.
//

import UIKit


class ViewController: UIViewController, coinMangerDelegate {
    

    //MARK: - Properties.
    var coinManger = CoinManager()
    
    //MARK: - Outlets.
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    //MARK: - LifeCycle Method.
    override func viewDidLoad() {
        super.viewDidLoad()
        coinManger.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        
    }

    func didUpdatePrice(price: String, currency: String) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = price
            self.currencyLabel.text = currency
        }
    }
    
    

}
//MARK: - UIPickerViewDataSource.
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManger.currencyArray.count
    }
}
//MARK: - UIPickerViewDelegate.
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManger.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManger.currencyArray[row]
        coinManger.getCoinPrice(for: selectedCurrency)
    }
}

