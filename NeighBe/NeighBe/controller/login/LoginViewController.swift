//
//  LoginViewController.swift
//  NeighBe
//
//  Created by 편성경 on 2022/04/06.
//

import UIKit

/*
 로그인
 
 ##### to-do #####
 - 화면 구현 O
 - 로그인 버튼 화면 이동
 - 회원가입 버튼 화면 이동
 - id, pw 찾기
 
 - 소셜 로그인
 - 자동 로그인 체크박스
 */

class LoginViewController: UIViewController {

    @IBOutlet weak var mainLogoImage: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var findUserButton: UIButton!
    @IBOutlet weak var joinUserButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 텍스트 크기 조정
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        findUserButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        joinUserButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)

    }
    
    /* Login Button Action */
    @IBAction func userLoginAction(_ sender: Any) {
        
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
