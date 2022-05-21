//
//  ValidateUtil.swift
//  NeighBe
//
//  Created by 편성경 on 2022/05/02.
//

import Foundation
import FirebaseFirestore

/*
 유효성 검사
 */
class ValidateUtil {
    
    /*
     이메일
     */
    func isValidEmail(email: String) -> Bool {
        
        /*
        let regexPattern  = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let regex = try?NSRegularExpression(pattern: regexPattern)
        */
        
        return true
    }
    
    /*
     비밀번호
     */
    
    /*
     닉네임
     */
    func isValidNickname(nickname: String) -> Bool {
        var result = false
        
        let db = Firestore.firestore()
        let userDB = db.collection("USER")
        let query = userDB.whereField("nickname", isEqualTo: nickname)
        query.getDocuments() { (qs, err) in
            if qs!.documents.isEmpty {
                // 중복 안 됨
                result = true
            } else {
                // 중복 됨
                result = false
            }
        }
        return result
    }
    
}
