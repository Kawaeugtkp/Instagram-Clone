//
//  CommentService.swift
//  Instagram Tutorial
//
//  Created by 川尻辰義 on 2022/12/22.
//

import Firebase

struct CommentService {
    
    static func uploadComment(comment: String, postID: String, user: User, completion: @escaping(FirestoreCompletion)) {
        let data: [String: Any] = ["uid": user.uid, "comment": comment, "timestamp": Timestamp(date: Date()), "username": user.username, "profileImageUrl": user.profileImageUrl]
        
        COLLECTION_POSTS.document(postID).collection("comment").addDocument(data: data, completion: completion)
    }
    
    static func fetchComments(forPost postID: String, completion: @escaping([Comment]) -> Void) {
        var comments = [Comment]()
        let query = COLLECTION_POSTS.document(postID).collection("comment").order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, error in //追加されたら自動てきにアップデートしてくれるのがaddSnapshotListener
            snapshot?.documentChanges.forEach({ change in
                if change.type == .added {
                    let data = change.document.data()
                    let comment = Comment(dictionary: data)
                    comments.append(comment)
                }
            })
            
            completion(comments)
        }
    }
}
