//
//  LibraryCongressTableViewCell.swift
//  libraryOfCongress
//
//  Created by Karen Fuentes on 10/30/16.
//  Copyright © 2016 Karen Fuentes. All rights reserved.
//

import UIKit

class LibraryCongressTableViewCell: UITableViewCell {
    @IBOutlet weak var libraryCongressTitle: UITextView!
    @IBOutlet weak var libraryCongressThumb: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        libraryCongressThumb = nil 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
