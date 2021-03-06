//
//  LoginViewController.swift
//  NeighBe
//
//  Created by 편성경 on 2022/04/06.
//

import UIKit
import FirebaseAuth

/*
 로그인
 
 ##### to-do #####
 - 화면 구현 O
 - 로그인 버튼 화면 이동
 - 회원가입 버튼 화면 이동 0
 - id, pw 찾기
 
 - 소셜 로그인
 - 자동 로그인 체크박스
 */

class LoginViewController: UIViewController {

    @IBOutlet weak var mainLogoImage: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var findUserButton: UIButton!
    @IBOutlet weak var joinUserButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    /* Login Button Action */
    @IBAction func userLoginAction(_ sender: Any) {
        
        let email: String = emailTextField.text!.description
        let pw: String = pwTextField.text!.description
        
        // 이메일 인증 여부 판단 -> model
        
        
        // Firebase Auth Login
        Auth.auth().signIn(withEmail: email, password: pw) {authResult, error in
            if authResult != nil {
                print("로그인 성공")
                
                let emailVerified = Auth.auth().currentUser?.isEmailVerified
                print("이메일 인증 여부 : \(emailVerified.debugDescription)")
                // 이메일 인증 여부 판단
                if Auth.auth().currentUser?.isEmailVerified == true {
                    // 이메일 인증 True
                    print("[LoginViewController] 이메일 인증 계정 로그인 성공")
                } else {
                    // 이메일 인증 False
                    print("[LoginViewController] 이메일 비인증 계정 로그인 실패")
                    try? Auth.auth().signOut()
                }
            } else {
                print("로그인 실패")
                print(error.debugDescription)
            }
            
        }
    }
    
    /* ID PW 찾기 화면 이동 Action */
    @IBAction func findUserAction(_ sender: Any) {
    }
    
    
    /* 회원가입 화면 이동 Action */
    @IBAction func joinUserAction(_ sender: Any) {
        // print("join button click")
        let joinVC = JoinUserViewController(nibName: "JoinUserViewController", bundle: nil)
        self.present(joinVC, animated: true, completion: nil)
    }
    
}
