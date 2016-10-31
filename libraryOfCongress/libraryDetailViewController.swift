//
//  libraryDetailViewController.swift
//  libraryOfCongress
//
//  Created by Karen Fuentes on 10/30/16.
//  Copyright © 2016 Karen Fuentes. All rights reserved.
//

import UIKit



class libraryDetailViewController: UIViewController {
    
    var selectedCongressLibrary: LibraryCongressImage?
    var subjectsOutOftheArray: String = " "

    @IBOutlet weak var fullCongressLibraryImage: UIImageView!
    @IBOutlet weak var congressLibraryTitleTextView: UITextView!
    @IBOutlet weak var congressLibrarySubjectsTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.congressLibraryTitleTextView.text = selectedCongressLibrary?.title
        
        for i in (selectedCongressLibrary?.subject)! {
            subjectsOutOftheArray += i + "\n"
        }
        self.congressLibrarySubjectsTextView.text = subjectsOutOftheArray
        
        self.fullCongressLibraryImage.downloadImage(urlString: (selectedCongressLibrary?.fullImage)!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
