//
//  ViewController.swift
//  HW#2
//
//  Created by Никита Артемов on 05.10.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let incrementButton = UIButton()
    private let valueLabel = UILabel()
    private let commentLabel = UILabel()
    private var commentView : UIView?
    private var value: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        setupIncrementButton()
        setupValueLabel()
        commentView = setupCommentView()
        updateCommentLabel(value: 1)
        setupMenuButtons()
    }
    
    private func setupValueLabel() {
        valueLabel.font = .systemFont(ofSize: 40.0, weight: .bold)
        valueLabel.textColor = .black
        valueLabel.text = "\(value)"
        view.addSubview(valueLabel)
        valueLabel.pinButton(to: incrementButton.topAnchor, 16)
        valueLabel.pinCenterX(to: view.centerXAnchor)
    }
    
    func setupIncrementButton(){
        incrementButton.setTitle("Increment", for: .normal)
        incrementButton.setTitleColor(.black, for: .normal)
        incrementButton.layer.cornerRadius = 12
        incrementButton.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        incrementButton.backgroundColor = .white
        incrementButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        incrementButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        incrementButton.layer.shadowOpacity = 1.0
        incrementButton.layer.shadowRadius = 10.0
        incrementButton.layer.masksToBounds = false
        incrementButton.layer.applyShadow()
        
        view.addSubview(incrementButton)
        
        incrementButton.setHeight(48)
        incrementButton.pinTop(to: view.centerYAnchor)
        incrementButton.pin(to: view, [.left : 24, .right : 24])
        
        incrementButton.addTarget(self, action: #selector(incrementButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func incrementButtonPressed() {
        incrementButton.isEnabled = false
        value += 1
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        
        UIView.transition(with: commentLabel,
                          duration: 0.25,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in self?.updateUI();
            self?.incrementButton.backgroundColor = .lightGray
            self?.incrementButton.backgroundColor = .white
        }) {
            completion in self.incrementButton.isEnabled = true
        }
    }
    
    private func setupCommentView() -> UIView {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 12
        view.addSubview(v)
        v.pinTop(to:view.safeAreaLayoutGuide.topAnchor)
        v.pin(to: view, [.left: 24, .right: 24])
        commentLabel.font = .systemFont(ofSize: 14.0,weight: .regular)
        commentLabel.textColor = .systemGray
        commentLabel.numberOfLines = 0
        commentLabel.textAlignment = .center
        v.addSubview(commentLabel)
        commentLabel.pin(to: v, [.top: 16, .left: 16, .bottom: 16, .right: 16])
        return v;
    }
    
    func updateCommentLabel(value: Int) {
        switch value {
        case 0...10:
            commentLabel.text = "1"
        case 10...20:
            commentLabel.text = "2"
        case 20...30:
            commentLabel.text = "3"
        case 30...40:
            commentLabel.text = "4"
        case 40...50:
            commentLabel.text = "! ! ! ! ! ! ! ! ! "
        case 50...60:
            commentLabel.text = "big boy"
        case 60...70:
            commentLabel.text = "70 70 70 moreeeee"
        case 70...80:
            commentLabel.text = "⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ "
        case 80...90:
            commentLabel.text = "80+\n go higher!"
        case 90...100:
            commentLabel.text = "100!! to the moon!!"
        default:
            break
        }
    }
    
    private func updateUI()
    {
        valueLabel.text = "\(value)"
        updateCommentLabel(value: value)
    }
    
    private func makeMenuButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        button.layer.applyShadow()
        return button
    }
    
    private func setupMenuButtons() {
        let colorsButton = makeMenuButton(title: "🎨")
        let notesButton = makeMenuButton(title: "🗒️")
        let newsButton = makeMenuButton(title: "📰")
        
        let buttonsSV = UIStackView(arrangedSubviews: [colorsButton, notesButton, newsButton])
        buttonsSV.spacing = 12
        buttonsSV.axis = .horizontal
        buttonsSV.distribution = .fillEqually
        view.addSubview(buttonsSV)
        buttonsSV.pin(to: self.view, [.left: 24, .right: 24])
        buttonsSV.pinButton(to: self.view.safeAreaLayoutGuide.bottomAnchor, 24)
    }
    
}
