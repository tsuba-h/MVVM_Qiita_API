//
//  QiitaDataSources.swift
//  MVVM_GithubAPI
//
//  Created by 服部　翼 on 2020/02/07.
//  Copyright © 2020 服部　翼. All rights reserved.
//

import RxDataSources

struct QiitaDataSources {
    var items: [QiitaItem]
}

extension QiitaDataSources: SectionModelType {
    typealias Item = QiitaItem
    init(original: QiitaDataSources, items: [QiitaItem]) {
        self = original
        self.items = items
    }
}
