//
//  JoinUserModel.swift
//  NeighBe
//
//  Created by 편성경 on 2022/05/03.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

/*
 To-Do
 이메일, 닉네임 중복 검사 로직 추가하기
 */
class JoinUserModel {
    
    // Firebase
    var firebaseDB: DatabaseReference!
    var firestore: Firestore!
    let db = Firestore.firestore()
    
    /*
     이메일 중복 검사
     */
    func isEmailCheck(email: String) {
        print("이메일 중복 검사 테스트 !!")
        db.collection("USER").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
    /*
     닉네임 중복 검사
     */
    func isNicknameCheck(nickname: String) {
        
    }
    
    
    /*
     회원가입시 사용자 정보 Firebase DB 저장
     */
    func saveUserInfo(uid: String!, email: String!) {
        firebaseDB = Database.database().reference(withPath: "User")
        firebaseDB.child(uid).setValue(["email":email,"homeYn":"N", "emailAuthYn":"N"])
    }
    
    /*
     인증 이메일 발송
     */
    func sendAuthEmail() {
        Auth.auth().currentUser?.sendEmailVerification { error in
            if error != nil {
                print("[JoinUserModel] sendAuthEmail() 이메일 전송 에러")
                print(error.debugDescription)
            } else {
                print("[JoinUserModel] sendAuthEmail() 이메일 전송 성공")
            }
        }
    }
    
}
