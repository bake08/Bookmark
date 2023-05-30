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
    
    private func setup(){
        view.backgroundColor = .white
        TF1 = textField(hindText: "Bookmark title")
        TF2 = textField(hindText: "Bookmark link (URL)")
        
        view.addSubview(TF1)
        view.addSubview(TF2)
        
        let title = textTitle(text: "Title")
        view.addSubview(title)
        
        title.snp.makeConstraints { make in
            make.bottom.equalTo(TF1.snp.top).offset(-16)
            make.leading.equalToSuperview().offset(18)
        }
        
        let lnk = textTitle(text: "Link")
        view.addSubview(lnk)
        lnk.snp.makeConstraints { make in
            make.top.equalTo(TF1.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(18)
        }
        
        setTF(tf: TF1)
        setTF(tf: TF2)
        
        TF1.snp.makeConstraints { make in
            make.top.equalTo(view.center)
            
        }
        
        TF2.snp.makeConstraints { make in
            make.top.equalTo(lnk.snp.bottom).offset(16)
        }
        
    }
    
    func textTitle(text: String) -> UILabel{
        let t = UILabel()
        t.text = text
        t.textAlignment = .center
        t.textColor = .black
        return t
    }

    
    private func setTF(tf : UITextField){
        tf.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(46)
            make.centerX.equalToSuperview()
        }
    }
   
    private func textField(hindText: String) -> UITextField{
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

