//
//  QiitaRepository.swift
//  MVVM_GithubAPI
//
//  Created by 服部　翼 on 2020/02/07.
//  Copyright © 2020 服部　翼. All rights reserved.
//

import Moya
import RxSwift

typealias QiitaAPIResponse = ((_ response: QiitaItem?, _ error: Swift.Error?) -> Void)

final class QiitaRepository {
    private static let qiitaAPIProvider = MoyaProvider<QiitaAPI>()
    private let disposeBag: DisposeBag = DisposeBag()
    
    static func getQiita() -> Observable<QiitaItem> {
        print("実行")
        return qiitaAPIProvider.rx.request(.getQiita)
            .map { response in
                try JSONDecoder().decode(QiitaItem.self, from: response.data)
        }.asObservable()
    }
}

