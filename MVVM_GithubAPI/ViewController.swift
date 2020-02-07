//
//  ViewController.swift
//  MVVM_GithubAPI
//
//  Created by 服部　翼 on 2020/02/07.
//  Copyright © 2020 服部　翼. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import Instantiate
import InstantiateStandard

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let disposeBag = DisposeBag()
    let viewModel = QiitaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

