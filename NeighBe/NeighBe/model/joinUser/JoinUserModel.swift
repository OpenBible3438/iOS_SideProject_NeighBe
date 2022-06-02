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
    func isEmailCheck(email: String) -> Bool {
        var result = false
        
        let userDB = db.collection("USER")
        // 입력한 이메일이 있는지 확인 쿼리
        let query = userDB.whereField("email", isEqualTo: email)
        query.getDocuments() { (qs, err) in
            
            if qs!.documents.isEmpty {
                print("데이터 중복 안 됨 가입 진행 가능")
                result = true
            } else {
                print("데이터 중복 됨 가입 진행 불가")
                result = false
            }
        }
        
        /*
         // store DB 불러오기 테스트
        db.collection("USER").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
        */
        return result
    }
    
    /*
     회원가입시 사용자 정보 Firebase DB 저장
     */
    func saveUserInfo(uid: String!, email: String!, pw: String!) {
        print("[JoinUserModel] saveUserInfo() 사용자 정보 firestore 저장")
        /*
        firebaseDB = Database.database().reference(withPath: "User")
        firebaseDB.child(uid).setValue(["email":email,"homeYn":"N", "emailAuthYn":"N"])
        */
        
        // 2022.06.02 Auth 회원가입 후 Firestore에 사용자 정보 저장
        let userDB = db.collection("USER")
        let userData : [String : String] = [
              "authYn" : "N"
            , "email" : email
            , "homeYn" : "N"
            , "nickname" : "unknown"
            , "pw" : pw
        ]
        userDB.document(email).setData(userData) { err in
            if let err = err {
                print("[JoinUserModel] saveUserInfo writing document err : \(err)")
            } else {
                
                print("[JoinUserModel] saveUserInfo writing document success!")
            }
        }
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
