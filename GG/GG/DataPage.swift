//
//  DataPage.swift
//  GG
//
//  Created by bakebrlk on 20.05.2023.
//

import UIKit
import SnapKit

class DataPage: UIViewController{
    
    var List = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    var topText: UILabel = {
        let text = UILabel()
        text.text = "Bookmark App"
        text.textAlignment = .center
        text.font = .boldSystemFont(ofSize: 17)
        text.textColor = .black
        return text
    }()
    
    var centerText: UILabel = {
        let text = UILabel()
        text.text = "Save your first bookmark"
        text.textAlignment = .center
        text.numberOfLines = 0
        text.textColor = .black
        text.font = .boldSystemFont(ofSize: 36)
        return text
    }()
    
    
    var btn: UIButton = {
        let btn = btn(text: "Add bookmark", color: "black")
        return btn
    }()
    
    @objc func actionForButton(){
        navigationController?.present(ViewController(), animated: true)
    }
    
    func setup(){
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        
        btn.addTarget(self, action: #selector(actionForButton), for: .touchUpInside)
        if(List.isEmpty){
            
            view.addSubview(topText)
            topText.translatesAutoresizingMaskIntoConstraints = false
            topText.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(56)
                make.centerX.equalToSuperview()
            }
            
            view.addSubview(centerText)
            centerText.translatesAutoresizingMaskIntoConstraints = false
            centerText.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.leading.equalToSuperview().offset(16)
                make.trailing.equalToSuperview().offset(-16)
            }
            
        }
        
        
        view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        setBtn(btn: btn, view: view)
    }
}
