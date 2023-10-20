//
//  SettingsViewController.swift
//  ColorizedDelegate
//
//  Created by John Doe on 20.10.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!

    var tempGreen: CGFloat!
    var tempRed: CGFloat!
    var tempBlue: CGFloat!
    
    unowned var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.value = Float(tempRed)
        greenSlider.value = Float(tempGreen)
        blueSlider.value = Float(tempBlue)
        setupView()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.saveSettings(redColor: CGFloat(redSlider.value), greenColor: CGFloat(greenSlider.value), blueColor: CGFloat(blueSlider.value))
        dismiss(animated: true)
    }
    
    @IBAction func sliderMoved() {
        setupView()
    }
    
    private func setupView() {
        colorView.layer.cornerRadius = 10
        redLabel.text = String(format: "%.1f", redSlider.value)
        greenLabel.text = String(format: "%.1f", greenSlider.value)
        blueLabel.text = String(format: "%.1f", blueSlider.value)
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        blueSlider.tintColor = .blue
        colorView.backgroundColor = UIColor (red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
    }
}
