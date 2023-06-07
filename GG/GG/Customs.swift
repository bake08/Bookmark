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
    btn.layer.cornerRadius = 16
    btn.snp.makeConstraints { make in
        make.height.equalTo(58)
        make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
        make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
    }
}


struct Data{
    let title: String
    let url: String
}



class MyTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
//        tableView.fillView(self.view)
        tableView.register(PostCell.self, forCellReuseIdentifier: "PostCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataPage.List.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else { return UITableViewCell() }
        cell.configureView(post: DataPage.List[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}


class PostCell: UITableViewCell {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    private let url: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let btn: UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(systemName: "arrowshape.turn.up.right.circle"), for: .normal)
        btn.tintColor = .black
        return btn
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configureView(post: Data) {
        self.nameLabel.text = post.title
        self.url.text = post.url
    }

    private func setUI() {

        [nameLabel, btn].forEach { self.addSubview($0) }

        
        nameLabel.snp.makeConstraints { make in
            make.leading.self.equalToSuperview().offset(16)
            make.centerY.self.equalToSuperview()
        }
        
        btn.imageView?.snp.makeConstraints({ make in
            make.width.height.equalTo(30)
        })
        
        btn.snp.makeConstraints { make in
            make.centerY.self.equalToSuperview()
            make.trailing.self.equalToSuperview().offset(-26)
        }

        
    }
}


extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {

//        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }

        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }

        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }

        setDimensions(width: width, height: height)
    }

    func setDimensions(width: CGFloat? = nil, height: CGFloat? = nil) {
//        translatesAutoresizingMaskIntoConstraints = false

        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }

    func centerInView(in view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false

        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    func centerX(in view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false

        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    func centerY(in view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false

        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    func fillView(_ view: UIView) {
//        translatesAutoresizingMaskIntoConstraints = false

        anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}
