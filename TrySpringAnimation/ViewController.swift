//
//  ViewController.swift (5.0)
//  TrySpringAnimation
//  
//  Created by Alexey Zinoviev on 13.06.2023
//
	

import UIKit
import SpringAnimation

final class ViewController: UIViewController {

    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var animationLabel: SpringLabel!
    
    private func randomPreset<T>(_ Enum: T.Type) -> String where T: CaseIterable & RawRepresentable {
        let index = Int.random(in: 0..<Enum.allCases.count - 1)
        return Enum.allCases[index as! T.AllCases.Index].rawValue as! String
    }
    
    @IBAction func startAnimationButton(_ sender: SpringButton) {
        animationView.animation = randomPreset(AnimationPreset.self)
        animationView.curve = randomPreset(AnimationCurve.self)
        animationView.force = CGFloat.random(in: 1...3)
        animationView.delay = CGFloat.random(in: 0...2)
        animationView.duration = CGFloat.random(in: 0.5...2)
        animationView.animate()
        
        animationLabel.text =
            """
            preset: \(animationView.animation)
            curve: \(animationView.curve)
            force: \(String(format: "%.1f", animationView.force))
            duration: \(String(format: "%.1f", animationView.duration))
            delay: \(String(format: "%.1f", animationView.delay))
            """
        
        sender.animation = "pop"
        sender.animate()
        
        
    }
}


