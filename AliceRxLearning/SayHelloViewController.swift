//
//  SayHelloViewController.swift
//  AliceRxLearning
//
//  Created by alice singh on 10/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SayHelloViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setUpNav()
     }
    
    func setUpNav() {
        let rightBar = UIBarButtonItem(title: "Next", style: .plain, target: nil, action: nil)
        navigationItem.setRightBarButton(rightBar, animated: true)
        
        rightBar.rx.tap.asDriver().drive(onNext: {
            let  detailPage = DetailViewController(self.nameLabel.text ?? "")
            self.navigationController?.pushViewController(detailPage, animated: true)
        })
        .disposed(by: disposeBag)
    }
    
    func bind() {
        nameField.rx.text
            .orEmpty
            .asObservable()
            .map { "Hello \($0)" }
        .bind(to: nameLabel.rx.text)
        .disposed(by: disposeBag)
    
    }
}
