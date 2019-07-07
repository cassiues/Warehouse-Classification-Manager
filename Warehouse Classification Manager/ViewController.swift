//
//  ViewController.swift
//  Warehouse Classification Manager
//
//  Created by 娄军伟 on 2019/7/4.
//  Copyright © 2019 fuckplus. All rights reserved.
//

import UIKit
import SnapKit


class ViewController: UIViewController{
    //用户密码输入框
    var userNameText:UITextField!
    var passwordText:UITextField!
    // MARK:- 页面加载时
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    

}
// MARK:- 页面元素
extension ViewController{
    // MARK:- 初始化页面元素
    func setupUI(){
        //创建一个用于显示背景图片的imageView
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "登录页背景")
        backgroundImage.contentMode = .scaleAspectFill //等比缩放填充（图片可能有部分显示不全）
        //将背景图片imageView插入到当前视图中
        self.view.addSubview(backgroundImage)
        //  创建logo
        let logoImg = UIImageView(image: UIImage(named: "logo"))
        // 创建输入页
        let inputView = UIView()
        // 设置背景图片
        inputView.layer.contents = UIImage(named:"登录页中间白色背景")?.cgImage
        
        /*******************创建SignUpButton()END******************/
        let signUpButton = UIButton()
        signUpButton.setTitle("Sign Up", for: .normal)        
        signUpButton.setTitleColor(UIColor.init(hexString: "666666"), for: .normal)
        inputView.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { (signUpButtonConstraint) in
            signUpButtonConstraint.top.equalToSuperview().offset(30)
            signUpButtonConstraint.right.equalToSuperview().offset(-20)
            signUpButtonConstraint.width.equalTo(100)
            signUpButtonConstraint.height.equalTo(40)
        }
        /*******************创建SignUpButton()END******************/
        
        /*******************创建UserNameView()START*******************/
        userNameText = UITextField()
        userNameText.placeholder = "Input your username";
        userNameText.delegate = self
        userNameText.clearButtonMode = .whileEditing
        userNameText.keyboardType = .namePhonePad
        userNameText.borderStyle = .none
        userNameText.leftView = UIView(frame:CGRect(x: 0, y: 0, width: 40, height: 40))
        userNameText.leftViewMode = UITextField.ViewMode.always
        
        //用户名输入框左侧图标
        let userNameView = UIImageView(image: UIImage(named: "username"))
        userNameView.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        userNameText.leftView!.addSubview(userNameView)
        let lineView = UIView()
        lineView.backgroundColor = UIColor.lightGray
        //  创建约束
        inputView.addSubview(userNameText)
        inputView.addSubview(lineView)
        userNameText.snp.makeConstraints { (userNameTextConstraint) in
            userNameTextConstraint.top.equalToSuperview().offset(80)
            userNameTextConstraint.left.equalToSuperview().offset(40)
            userNameTextConstraint.right.equalToSuperview().offset(-40)
            userNameTextConstraint.height.equalTo(40)
            userNameTextConstraint.centerX.equalToSuperview()
        }
        lineView.snp.makeConstraints { (lineViewConstraint) in
            
            lineViewConstraint.height.equalTo(1)
            lineViewConstraint.top.equalTo(userNameText.snp.bottom).offset(1)
            lineViewConstraint.left.equalTo(userNameText.snp.left).offset(10)
            lineViewConstraint.right.equalTo(userNameText.snp.right)
            
        }
        /*******************创建UserNameView()END*******************/
        
        
        /*******************创建passwordView()START*******************/
        passwordText = UITextField()
        passwordText.placeholder = "Input your password"
        passwordText.delegate = self
        userNameText.clearButtonMode = .whileEditing
        passwordText.borderStyle = .none
        passwordText.keyboardType = .asciiCapable
        //设置为密码样式
        passwordText.isSecureTextEntry = true
        passwordText.leftView = UIView(frame:CGRect(x: 0, y: 0, width: 40, height: 40))
        passwordText.leftViewMode = UITextField.ViewMode.always
        //密码输入框左侧图标
        let passwordView = UIImageView(image: UIImage(named: "password"))
        passwordView.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        passwordText.leftView!.addSubview(passwordView)
        let passwordlineView = UIView()
        passwordlineView.backgroundColor = UIColor.lightGray
        
        // 创建约束
        inputView.addSubview(passwordText)
        inputView.addSubview(passwordlineView)
        passwordText.snp.makeConstraints { (passwordTextConstraint) in
            passwordTextConstraint.top.equalTo(userNameText.snp.bottom).offset(20)
            passwordTextConstraint.left.equalTo(userNameText.snp.left)
            passwordTextConstraint.right.equalTo(userNameText.snp.right)
            passwordTextConstraint.height.equalTo(40)
            passwordTextConstraint.centerX.equalToSuperview()
        }
        passwordlineView.snp.makeConstraints { (passwordlineViewConstraint) in
            passwordlineViewConstraint.height.equalTo(1)
            passwordlineViewConstraint.top.equalTo(passwordText.snp.bottom).offset(1)
            passwordlineViewConstraint.left.equalTo(passwordText.snp.left).offset(10)
            passwordlineViewConstraint.right.equalTo(passwordText.snp.right)
            
        }
        /*******************创建passwordView()END*******************/
        
        
        /*******************创建loginButton()SART******************/
        let loginButton = UIButton()
        loginButton.backgroundColor = UIColor.init(hexString: "0b80e7")
        loginButton.setTitle("Login", for: .normal)
        //设置圆角
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 5.0
        inputView.addSubview(loginButton)
        loginButton.snp.makeConstraints { (loginButtonConstraint) in
            loginButtonConstraint.top.equalTo(passwordText.snp.bottom).offset(40)
            loginButtonConstraint.left.equalTo(userNameText.snp.left)
            loginButtonConstraint.right.equalTo(userNameText.snp.right)
            loginButtonConstraint.height.equalTo(40)
            loginButtonConstraint.centerX.equalToSuperview()
        }
        /*******************创建loginButton()END******************/
        
        
        //加入父控件
        self.view.addSubview(logoImg)
        self.view.addSubview(inputView)
        
        //创建logo约束
        logoImg.snp.makeConstraints { (ConstraintMaker) in
            //距离顶部30
            ConstraintMaker.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(30)
            //宽高100
            ConstraintMaker.size.equalTo(100).priority(.high)
            //居中
            ConstraintMaker.centerX.equalToSuperview()
        }
        //创建输入页约束
        inputView.snp.makeConstraints { (inputView) in
            //距离左右20
            inputView.left.equalToSuperview().offset(20)
            inputView.right.equalToSuperview().offset(-20)
            inputView.top.equalTo(logoImg.snp.bottom).offset(20)
            //水平居中
            inputView.height.equalTo(400)
        }
    }
    
}
// MARK:- 扩展方法
extension ViewController:UITextFieldDelegate{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(false)
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("将要开始编辑")
        return true
    }
    
    //设置输入框输入限制
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if userNameText == textField || passwordText == textField{
            //限制只能输入数字，不能输入特殊字符
            let length = string.lengthOfBytes(using: String.Encoding.utf8)
            for loopIndex in 0..<length {
                let char = (string as NSString).character(at: loopIndex)
                //限制只能输入数字和只能输入 a~z A~Z
                if (char < 48){return false} // 48 unichar for 0
                if (char > 57 && char < 65){return false}
                if (char > 90 && char < 97){return false}
                if (char > 122){return false}
            }
            //限制长度
            let proposeLength = (textField.text?.lengthOfBytes(using: String.Encoding.utf8))! - range.length + string.lengthOfBytes(using: String.Encoding.utf8)
            if proposeLength > 16 { return false }
            
        }
        return true
    }
}

