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
        loginAlert()
    }
    
    fileprivate func loginAlert(){
        let alertController = UIAlertController(
                                                title: "Вы прошли регистрацию?",
                                                message: "Введите ваш логин и пароль",
                                                preferredStyle: .alert
                                               )
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        alertController.addTextField { (userNameTextField) in
            userNameTextField.placeholder = "Введите логин"
        }
        alertController.addTextField { userPasswordTextField in
            userPasswordTextField.placeholder = "Введите пароль"
            userPasswordTextField.isSecureTextEntry = true
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    fileprivate func fetchImage() {
        imageURL = URL(string: "https://i.pinimg.com/564x/8b/3c/ba/8b3cba34d7fffd55a9bacdff8a50b2cc.jpg")
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }
    }
}
