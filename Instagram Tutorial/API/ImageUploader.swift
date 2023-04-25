//
//  ImageUploader.swift
//  Instagram Tutorial
//
//  Created by 川尻辰義 on 2022/12/07.
//

import FirebaseStorage
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return } //compressionQualityこの値が1.0だとダウンロードしたものそのまま使うから容量食って時間かかるから多少落としている
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image_\(filename)")
        
        ref.putData(imageData) { metadata, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, error in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
