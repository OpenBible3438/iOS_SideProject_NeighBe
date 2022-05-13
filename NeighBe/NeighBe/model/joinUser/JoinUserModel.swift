//
//  JoinUserModel.swift
//  NeighBe
//
//  Created by 편성경 on 2022/05/03.
//

import Foundation
import Firebase
import FirebaseAuth

class JoinUserModel {
    
    // Firebase
    var firebaseDB: DatabaseReference!
    
    /*
     회원가입시 사용자 정보 Firebase DB 저장
     */
    func saveUserInfo(uid: String!, email: String!) {
        firebaseDB = Database.database().reference(withPath: "User")
        firebaseDB.child(uid).setValue(["email":email,"homeYn":"N"])
    }
    
}
