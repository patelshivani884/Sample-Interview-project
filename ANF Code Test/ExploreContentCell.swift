//
//  Untitled.swift
//  ANF Code Test
//
//  Created by Shivani Patel on 12/20/24.
//

import UIKit

class ExploreContentCell: UITableViewCell{
    static let id = "exploreContentCell"
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    func initData(with content: ExploreContent)
    {
        title.text = content.title
        backgroundImage.image = UIImage(named: content.backgroundImage)
    }
    
}
