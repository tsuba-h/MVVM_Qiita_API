//
//  MainTableViewCell.swift
//  MVVM_GithubAPI
//
//  Created by 服部　翼 on 2020/02/10.
//  Copyright © 2020 服部　翼. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell(qiitaData: QiitaItem) {
        if qiitaData.user.name == "" {
            userLabel.text = "NoName"
        } else {
            userLabel.text = qiitaData.user.name
        }
        titleLabel.text = qiitaData.title
        
        if let url = URL(string: qiitaData.user.profileImageURL) {
            do {
                let data = try Data(contentsOf: url)
                iconImage.image = UIImage(data: data)
            } catch {
                print("error")
            }
        }
    }
}
