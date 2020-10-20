//
//  CustomSplashViewController.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//

import UIKit

class CustomSplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Mark: Give delay of 2 sec in Splash screen
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            self.jumpToNextVC()
        }
    }


//navigation to new screen
func jumpToNextVC()
{
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    guard let vc = storyBoard.instantiateViewController(withIdentifier: "NavigationController") as? NavigationController else {return}
    let customVcTransition = vc
    let transition = CATransition()
    transition.duration = 0
    transition.type = CATransitionType.push
    transition.subtype = CATransitionSubtype(rawValue: CATransitionSubtype.fromRight.rawValue)
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    view.window?.layer.add(transition, forKey: kCATransition)
    vc.modalPresentationStyle = .fullScreen
    present(customVcTransition, animated: false, completion: nil)
}

}

