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
        let controller = SignInViewController(nibName: "SignInViewController", bundle: nil)
        return controller
    }
    
    static func instantiateSheetViewController(isCanDismiss: Bool, lastViewController: UIViewController) -> SheetViewController {
        let controller = SignInViewController(nibName: "SignInViewController", bundle: nil)
        controller.lastViewController = lastViewController
        let sheetController = SheetViewController(controller: controller, sizes: [.fixed(540)])
        sheetController.dismissable = isCanDismiss
        sheetController.adjustForBottomSafeArea = false
        sheetController.blurBottomSafeArea = false
        sheetController.dismissOnBackgroundTap = true
        sheetController.extendBackgroundBehindHandle = false
        sheetController.topCornersRadius = 20
        sheetController.willDismiss = { _ in print("Will dismiss ")}
        sheetController.didDismiss = { _ in print("Will dismiss ")}
        return sheetController
    }
    
    @IBOutlet weak var appleIDStackView: UIStackView!
    var authInteractor: AuthInteractor? = AuthInteractor()
    var userInteractor: UserInteractor? = UserInteractor()
    var lastViewController: UIViewController?
    
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
            self.authInteractor?.signInWithApple(currentNonce: AuthHelper.randomNonceString(), credential: appleIDCredential, success: { (authResult, users, player) -> (Void) in
                PreferenceManager.instance.isLogin = true
                PreferenceManager.instance.uid = users.uid
                if let player = player, let game = player.game, game != "" {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.dismiss(animated: true) {
                        let completeProfileViewController = CompleteProfileViewController.instantiateViewController()
                        completeProfileViewController.users = users
                        completeProfileViewController.hidesBottomBarWhenPushed = true
                        completeProfileViewController.title = "Complete Registration"
                        self.lastViewController?.present(completeProfileViewController, animated: false, completion: nil)
                        self.sheetViewController?.closeSheet()
                    }
                }
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
