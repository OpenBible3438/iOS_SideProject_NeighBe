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
    
    // Firebase
    var firebaseDB: DatabaseReference!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var confirmPwTextField: UITextField!
    
    @IBOutlet weak var confirmSwitch: UISwitch!
    @IBOutlet weak var joinButton: UIButton!
    
    let joinUserModel: JoinUserModel! = JoinUserModel()

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
        
        var resultCode = 0
        
        //let dispatchGroup = DispatchGroup()
        let queue1 = DispatchQueue(label: "joinUserQueue1")
        let queue2 = DispatchQueue(label: "joinUserQueue2")
        let queue3 = DispatchQueue(label: "joinUserQueue3")
        queue1.sync {
            resultCode = joinUserModel.joinUser(email: inputEmail, pw: inputPW)
        }
        
        queue2.sync {
            print("joinUserModel.joinUser() resultCode : ", resultCode)
        }
        
        queue3.sync {
            if resultCode == 1 {
                // 회원가입 성공
                print("회원가입 성공 Alert")
                
                let alert = UIAlertController(title: "알림", message: "회원가입 성공!", preferredStyle: .alert)
                let alertOKAction = UIAlertAction(title: "OK", style: .default) {_ in
                    self.dismiss(animated: true)
                }
                alert.addAction(alertOKAction)
                self.present(alert, animated: false)
                
            } else {
                // 회원가입 실패
                print("회원가입 실패 Alert")
                
                let alert = UIAlertController(title: "알림", message: "회원가입 실패!", preferredStyle: .alert)
                let alertOKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(alertOKAction)
                self.present(alert, animated: false)
            }
        }
        
    }
    
    
    /* Cancel Button Action */
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}
