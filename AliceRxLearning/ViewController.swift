//
//  ViewController.swift
//  AliceRxLearning
//
//  Created by alice singh on 09/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit
import RxCocoa


class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func bindings() {
        self.stepper.rx.value.asObservable()
            .map { Int($0).description
            }.bind(to: self.counterLabel.rx.text)
            .disposed(by: disposeBag)
    }
}



//extension Reactive where Base: UIStepper {
//
//    /// Reactive wrapper for `value` property.
//    public var value: ControlProperty<Double> {
//        return base.rx.controlPropertyWithDefaultEvents(
//            getter: { stepper in
//                stepper.value
//        }, setter: { stepper, value in
//            stepper.value = value
//        }
//        )
//    }
//
//    /// Reactive wrapper for `stepValue` property.
//    public var stepValue: Binder<Double> {
//        return Binder(self.base) { stepper, value in
//            stepper.stepValue = value
//        }
//    }
//
//}




