//
//  QiitaRepository.swift
//  MVVM_GithubAPI
//
//  Created by 服部　翼 on 2020/02/07.
//  Copyright © 2020 服部　翼. All rights reserved.
//

import Moya
import RxSwift
import SwiftyJSON

typealias QiitaAPIResponse = ((_ response: QiitaItem?, _ error: Swift.Error?) -> Void)

final class QiitaRepository {
    private static let qiitaAPIProvider = MoyaProvider<QiitaAPI>()
    
    static func getQiita() -> Observable<[QiitaItem]> {
        return qiitaAPIProvider.rx.request(.getQiita)
            .map([QiitaItem].self)
            .asObservable()
    }
    
    static func jsonQiita() {
        let disposeBag: DisposeBag = DisposeBag()
        qiitaAPIProvider.rx.request(.getQiita)
            .subscribe { (event) in
                switch event {
                case .success(let response):
                    let json = try! JSON(data: response.data)
                    print(json)
                case .error(let error):
                    print(error)
                }
        }.disposed(by: disposeBag)
    }
}

