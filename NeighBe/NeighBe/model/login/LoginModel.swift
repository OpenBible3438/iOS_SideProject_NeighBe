//
//  LoginModel.swift
//  NeighBe
//
//  Created by 편성경 on 2022/06/08.
//

import Foundation
import FirebaseFirestore

class LoginModel {
    
    let db = Firestore.firestore()
    
    /* 로그인 계정 이메일 인증 여부 확인 */
    func isEmailAuth(email: String) -> String {
        var result = "N"
        let userDB = db.collection("USER")
        let query = userDB.document(email)
        query.getDocument{ (document, error) in
            if let document = document, document.exists{
                let data = document.get("authYn")
                if data.debugDescription == "Y" {
                    print("이메일 인증 계정")
                    result = "Y"
                } else {
                    print("이메일 비인증 계정")
                    result = "N"
                }
            } else {
                print("해당 이메일은 가입되지 않음 !")
            }
        }
        
        return result
    }
    
}
