//
//  ArticleViewController.swift
//  MVVM_GithubAPI
//
//  Created by 服部　翼 on 2020/02/12.
//  Copyright © 2020 服部　翼. All rights reserved.
//

import UIKit
import Instantiate
import InstantiateStandard
import WebKit

class ArticleViewController: UIViewController, StoryboardInstantiatable {

    @IBOutlet weak var wkWebView: WKWebView!
    var url: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlRequest = URLRequest(url: URL(string: url)!)
        wkWebView.load(urlRequest)
    }
}
