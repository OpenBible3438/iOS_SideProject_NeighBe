//
//  JoinUserViewController.swift
//  NeighBe
//
//  Created by 편성경 on 2022/04/06.
//

import UIKit
import FirebaseDatabase

/*
 회원가입
 */
class JoinUserViewController: UIViewController {
    
    // Firebase
    var firebaseDB: DatabaseReference!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var confirmPwTextField: UITextField!
    
    @IBOutlet weak var confirmSwitch: UISwitch!
    @IBOutlet weak var joinButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Switch, Button 비활성화
        confirmSwitch.isOn = false
        joinButton.isEnabled = false

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
        print("가입하기 click")
        
        /*
         Firebase Test Code
         가입하기 버튼 누르면 데이터 입력하고 화면 나가기.
         */
        let inputEmail: String? = emailTextField.text?.description
        let inputPW: String? = confirmPwTextField.text?.description
        
        firebaseDB = Database.database().reference()
        firebaseDB.child("memberJoin").setValue(["email":inputEmail, "password":inputPW])
        
        self.dismiss(animated: true)
    }
    
    
    /* Cancel Button Action */
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}
