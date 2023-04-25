//
//  AuthenticationViewModel.swift
//  Instagram Tutorial
//
//  Created by 川尻辰義 on 2022/12/05.
//

import UIKit

protocol formViewModel {
    func updateForm()
}

protocol AuthenticationViewModel {
    var formIsValid: Bool { get }
    var buttonBackgroundColor: UIColor { get }
    var buttonTitleColor: UIColor { get }
}

struct LoginViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        if let password = password {
            return email?.isEmpty == false && password.count >= 6
        } else {
            return false
        }
    }
    
    var buttonBackgroundColor: UIColor {
        return formIsValid ? .purple : .purple.withAlphaComponent(0.5)
    }
    
    var buttonTitleColor: UIColor {
        return formIsValid ? .white : UIColor(white: 1, alpha: 0.67)
    }
}

struct RegistrationViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    var fullname: String?
    var username: String?
    //画像についての記載がなく、formIsValidが正確なコードではないことに注意
    
    var formIsValid: Bool {
        if let password = password {
            return email?.isEmpty == false && password.count >= 6 && fullname?.isEmpty == false && username?.isEmpty == false
        } else {
            return false
        }
    }
    
    var buttonBackgroundColor: UIColor {
        return formIsValid ? .purple : .purple.withAlphaComponent(0.5)
    }
    
    var buttonTitleColor: UIColor {
        return formIsValid ? .white : UIColor(white: 1, alpha: 0.67)
    }
}

struct ResetPasswordViewModel: AuthenticationViewModel {
    var formIsValid: Bool { return email?.isEmpty == false }
    
    var buttonBackgroundColor: UIColor { return formIsValid ? .purple : .purple.withAlphaComponent(0.5) }
    
    var buttonTitleColor: UIColor { return formIsValid ? .white : UIColor(white: 1, alpha: 0.67) }
    
    var email: String?
}
