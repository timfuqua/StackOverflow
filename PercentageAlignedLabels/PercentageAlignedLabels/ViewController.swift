//
//  ViewController.swift
//  PercentageAlignedLabels
//
//  Created by Tim Fuqua on 10/12/15.
//  Copyright (c) 2015 FuquaProductions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var subView: UIView!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var speechLabel: UILabel!
  @IBOutlet weak var subViewLabel: UILabel!
  @IBOutlet weak var viewLabel: UILabel!
  
  @IBOutlet weak var toggleSpeechButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
//    speechLabel.hidden = true
    
    insetSpeechBubbleRedlines()
//    drawHalfLines()
  }
  
  @IBAction func toggleSpeechButtonPressed(sender: UIButton) {
    speechLabel.hidden = !speechLabel.hidden
  }
  
  private func drawHalfLines() {
    // vertical
    imageView.drawVertLineAtProportion(1.0)
    
    // horizontal
    imageView.drawHorizLineAtProportion(1.0)
  }
  
  private func insetSpeechBubbleRedlines() {
    imageView.drawVertLineAtProportion(0.65)
    imageView.drawVertLineAtProportion(1.8)
    imageView.drawHorizLineAtProportion(0.19)
    imageView.drawHorizLineAtProportion(0.63)
  }

}

extension UIView {
  
  /**
  Draws a vertical line proportional to the center x of the view.
  
  A `proportional` value of 0 is the left edge, while 2 is the right edge.
  
  :param: proportion The value from the left edge (0.0) to the right edge (2.0)
  :param: inColor The color to draw the line in (red by default)
  */
  func drawVertLineAtProportion(proportion: CGFloat, inColor: UIColor = UIColor.redColor()) {
    let size = self.frame.size
    
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    let context = UIGraphicsGetCurrentContext()
    
    let x = self.bounds.origin.x + proportion*self.frame.size.width/2
    
    var vertPath = UIBezierPath()
    vertPath.lineWidth = size.height/150.0
    vertPath.moveToPoint(CGPointMake(x, 0))
    vertPath.addLineToPoint(CGPointMake(x, self.frame.size.height))
    inColor.setStroke()
    vertPath.stroke()
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    self.addSubview(UIImageView(image: image))
  }
  
  /**
  Draws a horizontal line proportional to the center y of the view.
  
  A `proportional` value of 0 is the top edge, while 2 is the bottom edge.
  
  :param: proportion The value from the top edge (0.0) to the bottom edge (2.0)
  :param: inColor The color to draw the line in (red by default)
  */
  func drawHorizLineAtProportion(proportion: CGFloat, inColor: UIColor = UIColor.redColor()) {
    let size = self.frame.size
    
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    let context = UIGraphicsGetCurrentContext()
    
    let y = self.bounds.origin.y + proportion*self.frame.size.height/2
    
    var vertPath = UIBezierPath()
    vertPath.lineWidth = size.height/150.0
    vertPath.moveToPoint(CGPointMake(0, y))
    vertPath.addLineToPoint(CGPointMake(self.frame.size.width, y))
    inColor.setStroke()
    vertPath.stroke()
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    self.addSubview(UIImageView(image: image))
  }
  
}

