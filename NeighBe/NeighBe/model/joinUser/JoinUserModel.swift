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
    
    /*
     회원가입시 사용자 정보 Firebase DB 저장
     */
    func saveUserInfo() {
        // 모든 유효성 검사를 마친 후, 실제적으로 DB에 회원정보가 저장될 때, userCode 채번
        /*
        firebaseDB = Database.database().reference(withPath: "User")
        firebaseDB.child("userCode2").setValue(["email":inputEmail, "password":inputPW, "userCode":"userCode2"])
        */
    }
    
}
