
//
//  RGBView.swift
//  Challenge 3
//
//  Created by Евгения Зорич on 28.03.2023.
//
import UIKit
@IBDesignable

final class RGBView: UIView {
    
    @IBInspectable
    var spacing: CGFloat = 20 {
        didSet {
            setNeedsLayout()
        }
    }
    
    private let redUI: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let greenUI: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let blueUI: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    var uiViews = [UIView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    func setupView() {
        uiViews = [redUI, greenUI, blueUI]
        uiViews.forEach { addSubview($0) }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        let barCount = CGFloat(uiViews.count)
        if barCount > 0 {
            let barHeight = (bounds.height - (spacing * (barCount - 1))) / barCount
            var y = 0 as CGFloat
            for view in uiViews {
                view.frame = CGRect(x: 0, y: y, width: bounds.width, height: barHeight)
                y += barHeight + spacing
            }
        }
    }
}
