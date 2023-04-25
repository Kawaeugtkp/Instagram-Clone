//
//  Notification.swift
//  Instagram Tutorial
//
//  Created by 川尻辰義 on 2022/12/29.
//

import Firebase

enum NotificationType: Int {
    case like
    case follow
    case comment
    
    var notificationMessage: String {
        switch self {
        case .like: return " liked your post."
        case .follow: return " started following you."
        case .comment: return " commented on your post."
        }
    }
}

struct Notification {
    let uid: String
    var postImageUrl: String?
    var postId: String?
    let timestamp: Timestamp
    let type: NotificationType
    let id: String
    let userProfileImageUrl: String
    let username: String
    var userIsfollowed = false
    
    init(dictionary: [String: Any]) {
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.uid = dictionary["uid"] as? String ?? ""
        self.postId = dictionary["postId"] as? String ?? ""
        self.id = dictionary["id"] as? String ?? ""
        self.postImageUrl = dictionary["postImageUrl"] as? String ?? ""
        self.type = NotificationType(rawValue: dictionary["type"] as? Int ?? 0) ?? .like
        self.userProfileImageUrl = dictionary["userProfileImageUrl"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
    }
}
