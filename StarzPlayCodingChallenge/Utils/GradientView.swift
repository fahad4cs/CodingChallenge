//
//  GradientView.swift
//  HubSpot-CodingChallenge
//
//  Created by Apple on 24/11/2023.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var startColor: UIColor = .black {
        didSet {
            updateGradient()
        }
    }
    
    @IBInspectable var endColor: UIColor = .clear {
        didSet {
            updateGradient()
        }
    }
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func commonInit() {
        layer.addSublayer(gradientLayer)
        updateGradient()
    }
    
    private func updateGradient() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        setNeedsDisplay()
    }
}

//@IBDesignable class GradientView: UIView {
//    @IBInspectable var firstColor: UIColor = UIColor.red
//    @IBInspectable var secondColor: UIColor = UIColor.green
//
//    @IBInspectable var vertical: Bool = true
//
//    lazy var gradientLayer: CAGradientLayer = {
//        let layer = CAGradientLayer()
//        layer.colors = [firstColor.cgColor, secondColor.cgColor]
//        layer.startPoint = CGPoint.zero
//        return layer
//    }()
//
//    //MARK: -
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//
//        applyGradient()
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        applyGradient()
//    }
//
//    override func prepareForInterfaceBuilder() {
//        super.prepareForInterfaceBuilder()
//        applyGradient()
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        updateGradientFrame()
//    }
//
//    //MARK: -
//
//    func applyGradient() {
//        updateGradientDirection()
//        layer.sublayers = [gradientLayer]
//    }
//
//    func updateGradientFrame() {
//        gradientLayer.frame = bounds
//    }
//
//    func updateGradientDirection() {
//        gradientLayer.endPoint = vertical ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0)
//    }
//}
//
//@IBDesignable class ThreeColorsGradientView: UIView {
//    @IBInspectable var firstColor: UIColor = UIColor.red
//    @IBInspectable var secondColor: UIColor = UIColor.green
//    @IBInspectable var thirdColor: UIColor = UIColor.blue
//
//    @IBInspectable var vertical: Bool = true {
//        didSet {
//            updateGradientDirection()
//        }
//    }
//
//    lazy var gradientLayer: CAGradientLayer = {
//        let layer = CAGradientLayer()
//        layer.colors = [firstColor.cgColor, secondColor.cgColor, thirdColor.cgColor]
//        layer.startPoint = CGPoint.zero
//        return layer
//    }()
//
//    //MARK: -
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//
//        applyGradient()
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        applyGradient()
//    }
//
//    override func prepareForInterfaceBuilder() {
//        super.prepareForInterfaceBuilder()
//        applyGradient()
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        updateGradientFrame()
//    }
//
//    //MARK: -
//
//    func applyGradient() {
//        updateGradientDirection()
//        layer.sublayers = [gradientLayer]
//    }
//
//    func updateGradientFrame() {
//        gradientLayer.frame = bounds
//    }
//
//    func updateGradientDirection() {
//        gradientLayer.endPoint = vertical ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0)
//    }
//}
//
//@IBDesignable class RadialGradientView: UIView {
//
//    @IBInspectable var outsideColor: UIColor = UIColor.red
//    @IBInspectable var insideColor: UIColor = UIColor.green
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        applyGradient()
//    }
//
//    func applyGradient() {
//        let colors = [insideColor.cgColor, outsideColor.cgColor] as CFArray
//        let endRadius = sqrt(pow(frame.width/2, 2) + pow(frame.height/2, 2))
//        let center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
//        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
//        let context = UIGraphicsGetCurrentContext()
//
//        context?.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: endRadius, options: CGGradientDrawingOptions.drawsBeforeStartLocation)
//    }
//
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//
//        #if TARGET_INTERFACE_BUILDER
//            applyGradient()
//        #endif
//    }
//}
