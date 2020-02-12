//
//  QiitaViewModel.swift
//  MVVM_GithubAPI
//
//  Created by 服部　翼 on 2020/02/07.
//  Copyright © 2020 服部　翼. All rights reserved.
//

import RxSwift
import RxCocoa
import SwiftyJSON

//protocol QiitaViewModelInputs {
// viewからModel
//}

protocol QiitaViewModelOutputs {
    //viewに公開するやつ(viewModel -> view)
    var articles: Observable<[QiitaDataSources]> {get} //<- なんのget?
    //{get}「プロトコルを付加したクラス」利用するクラスからは、読み込みしかできない
    var error: Observable<Error> {get}
}

protocol QiitaViewModelType {
    var outputs: QiitaViewModelOutputs {get}
}


class QiitaViewModel: QiitaViewModelOutputs {
    
    //output
    var articles: Observable<[QiitaDataSources]>
    var error: Observable<Error>
    
    //other
    private let disposeBag = DisposeBag()
    
    init() {
        //outputs
        let _articles = PublishRelay<[QiitaDataSources]>() //PublishRelay -> .nextだけ流せる(初期値を持たない)
        articles = _articles.asObservable() //_article -> 内部で公開するやつ？
        
        let _error = PublishRelay<Error>()
        error = _error.asObservable()
        
        QiitaRepository.getQiita()
            .subscribe(onNext: { (response) in
                let dataSource = QiitaDataSources.init(items: response)
                _articles.accept([dataSource])
            }, onError: { (error) in
                _error.accept(error)
            }).disposed(by: disposeBag)
        
        //QiitaRepository.jsonQiita()
            
    }
    
}

extension QiitaViewModel: QiitaViewModelType {
    var outputs: QiitaViewModelOutputs {return self}
}

