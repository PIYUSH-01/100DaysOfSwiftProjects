//
//  DetailViewController.swift
//  CHALLENGEPROJECT1
//
//  Created by PIYUSH KHURANA on 26/12/19.
//  Copyright © 2019 PIYUSH KHURANA. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never // We added this line of code becozwhenin the viewController we added a code snippet to increase the size of the title in the navigation bar but i this view controller we do not want such big titles that's why we wrote this code.
        
        // Do any additional setup after loading the view.
        if let imageToLoad = selectedImage {
            imageView.layer.borderWidth = 1
            imageView.layer.borderColor = UIColor.lightGray.cgColor
            imageView.image = UIImage(named: imageToLoad)
           
        }
        
    }
    
    //The 2 functions give below that are viewWillApear and viewWillDisappear are used when the image has appeared and when wetap onimge the navigation bar must hide and we will be able to view the whole image
    // The other function viewWillDisappear is used in order to deny this property when we are on the table view controller where we have the list of images
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func shareTapped() {
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else{
            print("\nNo image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image, selectedImage!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem //For IPads
        present(vc, animated: true)
    }

}
