//
//  ViewController.swift
//  TuttProj
//
//  Created by Era-MobileApp on 16/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tapForBalanceImg: UIImageView!
    @IBOutlet weak var tapUi: UIView!
    @IBOutlet weak var tapForBalanceText: UILabel!
    @IBOutlet weak var tapForBalanceTextCenter: NSLayoutConstraint!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var textLbl: UILabel!
    var didTap = true
    var didTapBtn = true
    var isSelected = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textLbl.text = "Hello World"
        textLbl.font = .italicSystemFont(ofSize: 30)
        textLbl.backgroundColor = UIColor.blue
        textLbl.textAlignment = .center
        textLbl.textColor = UIColor.white
        textLbl.shadowColor = UIColor.black
        textLbl.isHighlighted = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTextLabelTap(sender:)))
        textLbl.isUserInteractionEnabled = true
        textLbl.addGestureRecognizer(tap)
        
        /*
         let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(touched(_:)))
         tapForBalanceImg.isUserInteractionEnabled = true
         tapForBalanceImg.addGestureRecognizer(gestureRecognizer)*/
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touched(_:)))
        tapForBalanceImg.isUserInteractionEnabled = true
        tapForBalanceImg.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func didTextLabelTap(sender: UITapGestureRecognizer){
        
        //           tapForBalanceImg.frame.origin.x = tapUi.bounds.minX
        //               UIView.animate(withDuration: 1.0) {
        //                   self.tapForBalanceImg.frame.origin.x = self.tapUi.bounds.maxX - self.tapForBalanceImg.bounds.width
        //
        //               }
        if(didTap){
            textLbl.backgroundColor = UIColor.brown
            didTap = false
        }
        else{
            textLbl.backgroundColor = UIColor.blue
            didTap = true
        }
        
    }
    
    
    @IBAction func changeBtnTapped(_ sender: Any) {
        
        if(didTapBtn)
        {
            mainView.backgroundColor = .orange
            didTapBtn = false
        }
        else{
            mainView.backgroundColor = .groupTableViewBackground
            didTapBtn = true
        }
    }
    
    /*
     @objc private func touched2(_ gestureRecognizer: UIGestureRecognizer) {
     if let touchedView = gestureRecognizer.view {
     if gestureRecognizer.state == .changed {
     let locationInView = gestureRecognizer.location(in: touchedView)
     
     var newPos = touchedView.frame.origin.x + locationInView.x
     
     
     // limit the scrolls to the edges of the parent view
     if newPos < 10 {
     newPos = 10
     } else if newPos > 200 {
     newPos = 200
     }
     
     touchedView.frame.origin.x = newPos
     
     let diff = 100.0 - touchedView.frame.origin.x
     tapForBalanceText.alpha = diff / 100
     
     } else
     if gestureRecognizer.state == .ended {
     if touchedView.frame.origin.x == 200 {
     tapForBalanceImg.alpha = 0
     tapForBalanceTextCenter.constant = 0
     tapForBalanceText.text = "Cancelling.."
     tapForBalanceText.alpha = 1
     } else {
     touchedView.frame.origin.x = 10
     tapForBalanceText.alpha = 1
     }
     }
     
     UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseInOut, animations: {
     self.view.layoutIfNeeded()
     }, completion: nil)
     }
     }
     */
    @objc private func touched(_ gestureRecognizer: UIGestureRecognizer) {
        
        //tapForBalanceImg.frame.origin.x = self.tapUi.bounds.maxX - self.tapForBalanceImg.bounds.width
        //tapForBalanceImg.frame.origin.x = tapUi.bounds.minX
        //UIView.animate(withDuration: <#T##TimeInterval#>, delay: <#T##TimeInterval#>, animations: <#T##() -> Void#>)
        
        /*
        UIView.animateKeyframes(withDuration: 3, delay: 0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                    self.tapForBalanceImg.frame.origin.x = (self.tapUi.bounds.maxX - self.tapForBalanceImg.bounds.maxX) - 5
                    self.tapForBalanceText.alpha = 0.0
                    self.tapForBalanceText.text = "10000 BDT"
                    self.tapForBalanceText.alpha = 1.0
                }
            )
            
            UIView.addKeyframe(withRelativeStartTime: 1.5, relativeDuration: 0.5, animations: {
                    self.tapForBalanceImg.frame.origin.x = self.tapUi.bounds.minX + 5
                }
            )
        })*/
        
        
        UIView.animate(withDuration: 3.0,
                       delay: 0.0,
                       animations: {
            self.tapForBalanceImg.frame.origin.x = (self.tapUi.bounds.maxX - self.tapForBalanceImg.bounds.maxX) - 5
            //self.tapForBalanceImg.frame.origin.x = self.tapUi.bounds.minX
            self.tapForBalanceText.alpha = 0.0
            self.tapForBalanceText.text = "10000 BDT"
            self.tapForBalanceText.alpha = 1.0
            
        },
                       completion: { _ in
            UIView.animate(withDuration: 3.0,delay: 1.0,
                           animations: {
                
                self.tapForBalanceImg.frame.origin.x = self.tapUi.bounds.minX + 5
            },completion: { _ in
                self.tapForBalanceText.alpha = 0.0
                self.tapForBalanceText.text = "Tap for balance"
                self.tapForBalanceText.alpha = 1.0
            })
        }
        )
        
        
        //+++++++++++++++++++ Prev+++++++++++++++++++++
        
        //        { (done) in
        //
        //            self.tapForBalanceImg.frame.origin.x = self.tapUi.bounds.minX
        //            self.tapForBalanceText.text = "Tap for balance"
        //            /*UIView.animate(withDuration: 3.0, delay: 1.0, animations: {
        //                //self.tapForBalanceImg.frame.origin.x = self.tapUi.bounds.maxX - self.tapForBalanceImg.bounds.width
        //                self.tapForBalanceImg.frame.origin.x = self.tapUi.bounds.minX
        //                self.tapForBalanceText.text = "Tap for balance"
        //            })*/
        //
        //        }
        //
        /*
         UIView.animate(
         withDuration: 3.0,
         delay: 0.0,
         animations: {
         self.tapForBalanceImg.frame.origin.x = self.tapUi.bounds.maxX - self.tapForBalanceImg.bounds.width
         //self.tapForBalanceImg.frame.origin.x = self.tapUi.bounds.minX
         self.tapForBalanceText.alpha = 0.0;
         self.tapForBalanceText.text = "10000 BDT";
         self.tapForBalanceText.alpha = 1.0;
         })
         { (done) in
         UIView.animate(
         withDuration: 3.0,
         delay: 1.0,
         animations: {
         //self.tapForBalanceImg.frame.origin.x = self.tapUi.bounds.maxX - self.tapForBalanceImg.bounds.width
         self.tapForBalanceImg.frame.origin.x = self.tapUi.bounds.minX
         self.tapForBalanceText.text = "Tap for balance"
         })
         { _ in
         self.tapForBalanceText.text = "Tap for balance"
         }
         }*/
        
    }
    
    
}

