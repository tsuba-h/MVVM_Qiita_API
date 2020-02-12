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
    let viewModel: QiitaViewModelType = QiitaViewModel()
    
    let dataSource = RxTableViewSectionedReloadDataSource<QiitaDataSources>(configureCell: { (dataSource, tableView, indexPath, qiitaItem) -> UITableViewCell in
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.setupCell(qiitaData: qiitaItem)
        return cell
    })
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
        
        viewModel.outputs.articles
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tabbleView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}



