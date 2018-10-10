//
//  ViewController.swift
//  AliceRxLearning
//
//  Created by alice singh on 09/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    var priceValue: Int = 0
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindings()
    }
    
   func bindings() {
        addButton.rx.tap
            .subscribe(onNext: {
                print("add button")
                self.priceValue = self.priceValue + 1
                self.priceLabel.text = String(self.priceValue)
            })
            .disposed(by: disposeBag)
        
        minusButton.rx.tap
            .subscribe(onNext: {
                print("minus button")
                self.priceValue = self.priceValue - 1
                self.priceLabel.text = String(self.priceValue)
            })
            .disposed(by: disposeBag)
    }
}




