//
//  WelcomePage.swift
//  GG
//
//  Created by bakebrlk on 20.05.2023.
//

import UIKit
import SnapKit

class WelcomePage: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    var img: UIImageView = {
        let img = UIImageView(image:  UIImage(named: "welcome"))
        return img
    }()
    
    
    var text: UILabel = {
        let text = UILabel()
        text.text = "Save all interesting links in one app"
        text.textColor = .white
        text.numberOfLines = 0
        text.font = .boldSystemFont(ofSize: 36)
        return text
    }()
    
    var btn: UIButton = {
        let btn = btn(text: "Let’s start collecting", color: "white")
        return btn
    }()
    
    @objc func actionForButton(){
        navigationController?.pushViewController( DataPage(), animated: true)
    }
    
    func setup(){
        view.addSubview(img)
                
        view.addSubview(btn)
        setBtn(btn: btn, view: view)
        btn.addTarget(self, action: #selector(actionForButton), for: .touchUpInside)
        
        view.addSubview(text)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(btn.snp.top).offset(-16)
        }
    }
}
