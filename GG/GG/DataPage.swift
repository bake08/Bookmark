//
//  DataPage.swift
//  GG
//
//  Created by bakebrlk on 20.05.2023.
//

import UIKit
import SnapKit

class DataPage: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  DataPage.List.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else { return UITableViewCell() }
            cell.configureView(post: DataPage.List[indexPath.row])
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    static var List = [Data]()
    
    func addData(title: String, url: String){
        DataPage.List.append(Data(title: title, url: url))
        
        let indexPath = IndexPath(row: DataPage.self.List.count - 1, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
        
        self.tableView.reloadData()
        print(DataPage.List)
    }
    
    
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
        let nextView = ViewController()
        let nav = UINavigationController(rootViewController: nextView)
        navigationController?.present(nav, animated: true, completion: nil)
       
    }
    
    private func centerMaterial(){

        if(DataPage.List.isEmpty){
            
            view.addSubview(centerText)
            centerText.translatesAutoresizingMaskIntoConstraints = false
            centerText.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.leading.equalToSuperview().offset(16)
                make.trailing.equalToSuperview().offset(-16)
            }
            
        }else{
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.frame = view.bounds
            tableView.register(PostCell.self, forCellReuseIdentifier: "PostCell")
            tableView.translatesAutoresizingMaskIntoConstraints = false
            
            self.view.addSubview(tableView)

            tableView.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
            }

       
            
            
        }
    }
    
    func setup(){
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        DataPage.List.append(Data(title: "Youtube", url: "youtube.com"))
        DataPage.List.append(Data(title: "Youtube", url: "youtube.com"))
        DataPage.List.append(Data(title: "Youtube", url: "youtube.com"))
        DataPage.List.append(Data(title: "Youtube", url: "youtube.com"))
        DataPage.List.append(Data(title: "Youtube", url: "youtube.com"))
        DataPage.List.append(Data(title: "Youtube", url: "youtube.com"))
        DataPage.List.append(Data(title: "Youtube", url: "youtube.com"))
        DataPage.List.append(Data(title: "Youtube", url: "youtube.com"))
        DataPage.List.append(Data(title: "Youtube", url: "youtube.com"))
        DataPage.List.append(Data(title: "Youtube", url: "youtube.com"))
        
        centerMaterial()
        
        print(DataPage.List.count)
        
        view.addSubview(topText)
        topText.translatesAutoresizingMaskIntoConstraints = false
        topText.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(56)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(actionForButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        setBtn(btn: btn, view: view)
    }
}
