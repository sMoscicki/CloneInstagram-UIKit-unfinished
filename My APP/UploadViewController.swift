//
//  UploadViewController.swift
//  My APP
//
//  Created by s.moscicki@activision on 13/03/2023.
//

import UIKit
import FirebaseCore
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth


class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    @IBAction func backButton(_ sender: Any)
    {
        performSegue(withIdentifier: "backToMainPageUpload", sender: nil)
    }
    
    
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var outletButton: UIButton!
    
    @IBAction func uploadButton(_ sender: Any)
    {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.05){
            
            
            let uiId = UUID().uuidString
            let imageReference = mediaFolder.child("\(uiId).jpg")
            imageReference.putData(data, metadata: nil) { metadata, error in
                if error != nil{
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }else{
                    imageReference.downloadURL { (url, error) in
                        if error == nil{
                            var imageUrl = url?.absoluteString
                            
                            
                            let fireStoreDatabase = Firestore.firestore()
                            var fireStoreReference: DocumentReference? = nil
                            
                            //Disabled postComment for this version by problem with permission when the User want add Comment below photo
                            //"postComment": self.commentText.text!,
                            
                            let fireStorePost = ["imageUrl": imageUrl!, "postedBy": Auth.auth().currentUser!.email!, "data": FieldValue.serverTimestamp(), "likes": 0] as [String: Any]
                        
                            fireStoreReference = fireStoreDatabase.collection("Posts").addDocument(data: fireStorePost, completion: { (error) in
                
                                if error == nil
                                {
                                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                                }else{
                                    self.imageView.image = UIImage(named: "dog.jpg")
                                    self.commentText.text = " "
                                }
                        
                            })
                        }
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecognizer)

    }
    
    @objc func chooseImage()
    {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func makeAlert(titleInput: String, messageInput: String)
    {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }


}
