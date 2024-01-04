//
//  ViewController.swift
//  Assignment4TableView
//
//  Created by Mac on 04/01/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var postTableView: UITableView!
    var post : [Post] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        initilizeTableView()
        registerXibWithTableView()
        fetchDataFromApi4()
    }
    func initilizeTableView(){
        postTableView.delegate = self
        postTableView.dataSource = self
    }
    func  registerXibWithTableView(){
        let uiNib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        postTableView.register(uiNib, forCellReuseIdentifier: "CustomTableViewCell")
    }
    func fetchDataFromApi4(){
        let postUrl = URL(string: "https://jsonplaceholder.typicode.com/comments")
        var postRequest = URLRequest(url: postUrl!)
        postRequest.httpMethod = "Get"
        let postUrlSesson = URLSession(configuration: .default)
        let dataTask = postUrlSesson.dataTask(with: postRequest) { postData, postRequest, postError in
            let postUrlResponse = try! JSONSerialization.jsonObject(with: postData!) as! [[String : Any]]
            for eachResponse in postUrlResponse {
                let postDictonary = eachResponse as! [String : Any]
                let postId = postDictonary["postId"] as! Int
                let postid = postDictonary["id"] as! Int
                let postemail = postDictonary["email"] as! String
                let postname = postDictonary["name"] as! String
                let postbody = postDictonary["body"] as! String
                let Object = Post(postId: postid, id: postid, name: postname, email: postemail, body: postbody)
                self.post.append(Object)
            }
            DispatchQueue.main.async {
                self.postTableView.reloadData()
            }
        }
        dataTask.resume()
    }
}
extension ViewController : UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300.0
    }
}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        post.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postTableViewCell = self.postTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        postTableViewCell.postIdLabel.text = String(post[indexPath.row].postId)
        postTableViewCell.idLabel.text = String(post[indexPath.row].id)
        postTableViewCell.nameLabel.text = (post[indexPath.row].name)
        postTableViewCell.emailLabel.text = (post[indexPath.row].email)
        postTableViewCell.bodyLabel.text = (post[indexPath.row].body)
        return postTableViewCell
    }
}
