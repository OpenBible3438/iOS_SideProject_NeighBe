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
     회원가입
     Firebase Auth 사용자 등록
     */
    func joinUser(email: String, pw: String) -> Int {
        
        print("JoinUserModel.joinUser() 실행")
        
        var resultCode = 0
        
        Auth.auth().createUser(withEmail: email, password: email) { authResult, error in
            if authResult != nil {
                print("JoinUserModel.joinUser() 회원가입 성공")
                print("JoinUserModel.joinUser() 자동 로그인")
                resultCode = 1
            } else {
                print("JoinUserModel.joinUser() 회원가입 실패")
                print(error.debugDescription)
                resultCode = 0
            }
        }
        
        
        return resultCode
    }
    
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
