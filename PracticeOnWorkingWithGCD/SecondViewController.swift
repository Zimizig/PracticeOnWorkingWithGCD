//
//  SecondViewController.swift
//  PracticeOnWorkingWithGCD
//
//  Created by Роман on 14.07.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
            
            imageView.image = newValue
            imageView.sizeToFit()
            imageView.layer.cornerRadius = 30
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }
    
    fileprivate func fetchImage() {
        imageURL = URL(string: "https://i.pinimg.com/564x/8b/3c/ba/8b3cba34d7fffd55a9bacdff8a50b2cc.jpg")
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
        self.image = UIImage(data: imageData)
    }
}
