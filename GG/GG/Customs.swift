//
//  Customs.swift
//  GG
//
//  Created by bakebrlk on 20.05.2023.
//

import UIKit
import SnapKit


func btn(text: String, color: String) -> UIButton{
    let btn = UIButton()
    btn.setTitle(text, for: .normal)
    btn.backgroundColor = UIColor(named: color)
    
    if(color == "white"){
        btn.setTitleColor(.black, for: .normal)
    }else{
        btn.setTitleColor(.white, for: .normal)
    }
    
    return btn
}

func setBtn(btn: UIButton, view: UIView){
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.layer.cornerRadius = 16
    btn.snp.makeConstraints { make in
        make.width.equalTo(358)
        make.height.equalTo(58)
        make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
        make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
    }
}
