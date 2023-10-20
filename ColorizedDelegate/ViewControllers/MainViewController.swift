//
//  ViewController.swift
//  ColorizedDelegate
//
//  Created by John Doe on 20.10.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func saveSettings(redColor: CGFloat, greenColor: CGFloat, blueColor: CGFloat)
}

final class MainViewController: UIViewController {
    
    var red: CGFloat!
    var green: CGFloat!
    var blue: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        red = 0.0
        green = 0.0
        blue = 0.0
        view.backgroundColor = UIColor (red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.tempRed = red
        settingsVC.tempGreen = green
        settingsVC.tempBlue = blue
        settingsVC.delegate = self
    }

}

extension MainViewController: SettingsViewControllerDelegate {
    func saveSettings(redColor: CGFloat, greenColor: CGFloat, blueColor: CGFloat) {
        red = redColor
        green = greenColor
        blue = blueColor
        view.backgroundColor = UIColor (red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }
    
    
}

