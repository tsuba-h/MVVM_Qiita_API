//
//  QiitaViewModel.swift
//  MVVM_GithubAPI
//
//  Created by 服部　翼 on 2020/02/07.
//  Copyright © 2020 服部　翼. All rights reserved.
//

import RxSwift
import RxCocoa

//protocol QiitaViewModelInputs {
//}

protocol QiitaViewModelOutputs {
    var articles: Observable<[QiitaDataSources]> {get} //<- なんのget?
    var error: Observable<Error> {get}
}

protocol QiitaViewModelType {
    //var inputs: QiitaViewModelInputs {get}
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
        let _articles = PublishRelay<[QiitaDataSources]>() //.nextだけ流せる(初期値を持たない)
        articles = _articles.asObservable()
        
        let _error = PublishRelay<Error>()
        error = _error.asObservable()
    }
    
}

