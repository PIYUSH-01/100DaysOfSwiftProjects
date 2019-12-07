//
//  ViewController.swift
//  Project1
//
//  Created by PIYUSH KHURANA on 21/11/19.
//  Copyright © 2019 PIYUSH KHURANA. All rights reserved.
//

import UIKit //means “this file will reference the iOS user interface toolkit.”

//A view controller is best thought of as being one screen of information.
class ViewController: UITableViewController {
    
    var pictures = [String]()
    var X: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Storm Viewer"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!  //this line says, "tell me where I can find all those images I added to my app."
        let items = try! fm.contentsOfDirectory(atPath: path)
     
        
        for item in items {
            if item.hasPrefix("nssl"){
                //this is the image to be loaded
                pictures.append(item)
            }
        }
        pictures.sort()
        print(pictures)
        X = pictures.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.selectedPictureNumber = indexPath.row + 1
            vc.totalPictures = pictures.count
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

