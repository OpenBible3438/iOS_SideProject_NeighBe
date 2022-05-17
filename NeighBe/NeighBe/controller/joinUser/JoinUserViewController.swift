//
//  JoinUserViewController.swift
//  NeighBe
//
//  Created by 편성경 on 2022/04/06.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseAuth

/*
 회원가입
 
 ##### to-do #####
 - memberCode 채번
 - 이메일 형식 유효성 검사
 - 이메일 중복 검사
 - 비밀번호 검증
 - 비밀번호 확인
 */
class JoinUserViewController: UIViewController {
    
    let joinUserModel: JoinUserModel! = JoinUserModel()
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var confirmPwTextField: UITextField!
    
    @IBOutlet weak var confirmSwitch: UISwitch!
    @IBOutlet weak var joinButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Switch, Button 비활성화
        confirmSwitch.isOn = false
        joinButton.isEnabled = false
        
        idTextField.addTarget(self, action: #selector(idValidate), for: .editingChanged)

    }
    
    /* TextField Validate */
    // ID
    @objc func idValidate(sender: UITextField) {
        
    }
    
    /* 개인정보 이용약관 동의 스위치 on off Action */
    @IBAction func confirmSwitchAction(_ sender: Any) {
        if confirmSwitch.isSelected == false {
            confirmSwitch.isSelected = true
            joinButton.isEnabled = true
        } else {
            confirmSwitch.isSelected = false
            joinButton.isEnabled = false
        }
    }
    
    /* 가입하기 Button Action */
    @IBAction func joinButtonAction(_ sender: Any) {
        let inputEmail: String = idTextField.text!.description
        let inputPW: String = confirmPwTextField.text!.description
        
        print("[JoinUserViewController] joinButtonAction() 시작")
        
        // 회원가입 로직
        // joinUserModel.joinUser(email: inputEmail, pw: inputPW)
        
        Auth.auth().createUser(withEmail: inputEmail, password: inputPW) {authResult, error in
            if authResult != nil {
                // 회원가입 성공
                // DB 회원 데이터 저장 로직 추가
                print("[JoinUserViewController] Firebase 회원가입 성공")
                print("[JoinUserViewController] 유저 자동 로그인")
                print("[JoinUserViewController] 유저 정보 DB 저장")
                
                let user = Auth.auth().currentUser
                if let user = user {
                    let uid = user.uid
                    let email = user.email
                    
                    self.joinUserModel.saveUserInfo(uid: uid, email: email) // 가입된 회원 정보 DB 저장
                    self.joinUserModel.sendAuthEmail() // 인증 이메일 발송
                    try? Auth.auth().signOut()
                }
                
                let alert = UIAlertController(title: "알림", message: "회원가입 성공!", preferredStyle: .alert)
                let alertOKAction = UIAlertAction(title: "OK", style: .default) {_ in
                    self.dismiss(animated: true)
                }
                alert.addAction(alertOKAction)
                self.present(alert, animated: false)
                
            } else {
                // 회원가입 실패
                
                print("[JoinUserViewController] Firebase 회원가입 실패")
                let alert = UIAlertController(title: "알림", message: "회원가입 실패!", preferredStyle: .alert)
                let alertOKAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(alertOKAction)
                self.present(alert, animated: false)
            }
        }
        print("[JoinUserViewController] joinButtonAction() 종료")
        
    }
    
    
    /* Cancel Button Action */
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}
