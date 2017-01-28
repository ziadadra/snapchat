//
//  PictureViewController.swift
//  snapchat
//
//  Created by ziad adra on 1/26/17.
//  Copyright © 2017 ziad adra. All rights reserved.
//

import UIKit
import Firebase


class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{

    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    var uuid = NSUUID().uuidString
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
       imagePicker.delegate = self
       nextButton.isEnabled = false
       
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        nextButton.isEnabled = true
        
        imagePicker.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
     //   imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
        
    }

    @IBAction func nextTapped(_ sender: Any) {
        
        nextButton.isEnabled = false
       
        let imagesFolder = FIRStorage.storage().reference().child("images")
        
        
        
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)!
        
        
        imagesFolder.child("\(uuid).jpg").put(imageData, metadata: nil, completion: {(metadata, error) in
            print ("we tried to upload")
            if error != nil {
                print ("We had an error:\(error)")
            } else {
                
             //   print(metadata?.downloadURL())
                
                 self.performSegue(withIdentifier: "selectUserssegue", sender: metadata?.downloadURL()!.absoluteString)
                
            }
        })
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! SelectuserViewController
        nextVC.imageURL = sender as! String
        
        nextVC.descrip = descriptionTextField.text!
        nextVC.uuid = uuid
        
        
        
       
    }
}
