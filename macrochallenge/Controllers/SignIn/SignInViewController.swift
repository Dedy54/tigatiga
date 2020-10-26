//
//  SignInViewController.swift
//  macrochallenge
//
//  Created by Dedy Yuristiawan on 23/10/20.
//  Copyright © 2020 tigatiga. All rights reserved.
//

import UIKit
import AuthenticationServices

class SignInViewController: UIViewController {
    
    static func instantiateViewController() -> SignInViewController {
        let controller = SignInViewController(nib: R.nib.signInViewController)
        return controller
    }
    
    @IBOutlet weak var appleIDStackView: UIStackView!
    var authInteractor: AuthInteractor? = AuthInteractor()
    var userInteractor: UserInteractor? = UserInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupProviderLoginView()
    }
    
    func setupProviderLoginView() {
        let authorizationButton = ASAuthorizationAppleIDButton(type: .default, style: .whiteOutline)
        authorizationButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
        authorizationButton.cornerRadius = 20
        
        self.appleIDStackView.addArrangedSubview(authorizationButton)
    }
    
    @objc func handleAuthorizationAppleIDButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
}

extension SignInViewController : ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            self.authInteractor?.signInWithApple(currentNonce: AuthHelper.randomNonceString(), credential: appleIDCredential, success: { (authResult, users) -> (Void) in
                print(authResult)
                print(users)
            }, failure: { (error) -> (Void) in
                print(error)
            })
        case let passwordCredential as ASPasswordCredential:
            let username = passwordCredential.user
            let password = passwordCredential.password
            
            print("passwordCredential.username : \(username)")
            print("passwordCredential.password : \(password)")
            
            self.dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
    
}
