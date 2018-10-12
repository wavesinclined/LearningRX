//
//  DetailViewController.swift
//  AliceRxLearning
//
//  Created by alice singh on 10/10/18.
//  Copyright © 2018 alice singh. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

class DetailViewController: UIViewController {
    let nameRelay = BehaviorSubject<Int>(value: 0)
    
    var detail: String
    lazy var detailLabel: UILabel = {
        var label = UILabel()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setupData()
    }
    
    init(_ detailText: String) {
        self.detail = detailText
        super.init(nibName: nil, bundle: nil)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData() {
        detailLabel.text = detail
    }
    
    func setUpViews() {
        self.view.addSubview(detailLabel)
        self.view.backgroundColor = UIColor.white
        
        detailLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
}

extension DetailViewController {
    
    func bindView() {
        
    }
    
}
