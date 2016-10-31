//
//  LibraryCongressTableViewController.swift
//  libraryOfCongress
//
//  Created by Karen Fuentes on 10/30/16.
//  Copyright © 2016 Karen Fuentes. All rights reserved.
//

import UIKit

class LibraryCongressTableViewController: UITableViewController {
    internal var randomLibraryCongress = [LibraryCongressImage]()
    var selectedLibraryCell: LibraryCongressImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        ApiManager.manager.retrieveData { (data: Data?) in
            if data != nil {
                if let libraryCongress = LibraryCongressImage.giphys(from: data!) {
                    self.randomLibraryCongress = libraryCongress
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return randomLibraryCongress.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryCongressCell", for: indexPath) as! LibraryCongressTableViewCell
        cell.imageView?.downloadImage(urlString: randomLibraryCongress[indexPath.row].thumbImage)
        cell.libraryCongressTitle.text = randomLibraryCongress[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedLibraryCell = randomLibraryCongress[indexPath.row]
        performSegue(withIdentifier: "libraryCongressDetailSegue", sender: selectedLibraryCell)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "libraryCongressDetailSegue" {
            if let destination = segue.destination as? libraryDetailViewController {
               destination.selectedCongressLibrary = sender as! LibraryCongressImage?
            }
        }
    }
 

}
