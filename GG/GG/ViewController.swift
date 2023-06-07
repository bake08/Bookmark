//
//  ViewController.swift
//  GG
//
//  Created by bakebrlk on 20.05.2023.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    var TF1 = UITextField()
    var TF2 = UITextField()
    
    private func setup() {
        
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0)
        
        let backG = UIView()
        backG.layer.cornerRadius = 12
        backG.backgroundColor = .white
        view.addSubview(backG)
        backG.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(400)
            make.width.equalToSuperview()
        }
        
        TF1 = textField(hindText: "Bookmark title")
        TF2 = textField(hindText: "Bookmark link (URL)")
        
        backG.addSubview(TF1)
        backG.addSubview(TF2)
        
        let title = textTitle(text: "Title")
        backG.addSubview(title)
        
        title.snp.makeConstraints { make in
            make.bottom.equalTo(TF1.snp.top).offset(-16)
            make.leading.equalToSuperview().offset(18)
        }
        
        let lnk = textTitle(text: "Link")
        backG.addSubview(lnk)
        lnk.snp.makeConstraints { make in
            make.top.equalTo(TF1.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(18)
        }
        
        setTF(tf: TF1)
        setTF(tf: TF2)
        
        TF1.snp.makeConstraints { make in
            make.top.equalTo(backG.center).offset(100)
            
        }
        
        TF2.snp.makeConstraints { make in
            make.top.equalTo(lnk.snp.bottom).offset(16)
        }
        
        backG.addSubview(closeBtn)
        closeBtn.snp.makeConstraints { make in
            make.bottom.equalTo(title.snp.top).offset(-22)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        let btn = btn(text: "Save", color: "black")
        backG.addSubview(btn)
        btn.addTarget(self, action: #selector(addData), for: .touchUpInside)
        setBtn(btn: btn, view: backG)
        
        closeBtn.addTarget(self, action: #selector(action), for: .touchUpInside)
    }
    
    private var closeBtn: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("x", for: .normal)
        return btn
    }()
    
    @objc func action() {
        dismiss(animated: true)
    }
    
    var delegate = DataPage()
    
    @objc private func addData() {
        let title: String = TF1.text ?? ""
        let url: String = TF2.text ?? ""
        if title != "" && url != "" {
            delegate.addData(title: title, url: url)
            dismiss(animated: true)
        }
    }
    
    func textTitle(text: String) -> UILabel {
        let t = UILabel()
        t.text = text
        t.textAlignment = .center
        t.textColor = .black
        return t
    }
    
    private func setTF(tf: UITextField) {
        tf.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(46)
            make.centerX.equalToSuperview()
        }
    }
    
    private func textField(hindText: String) -> UITextField {
        let t = TextFieldWithPadding()
        t.placeholder = hindText
        t.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.933, alpha: 1)
        t.layer.cornerRadius = 16
        return t
    }
}

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 10,
        left: 20,
        bottom: 10,
        right: 20
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
