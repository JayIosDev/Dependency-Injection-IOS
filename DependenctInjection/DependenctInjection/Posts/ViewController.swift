//
//  ViewController.swift
//  DependenctInjection
//
//  Created by Rahul Sharma on 02/10/21.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var commentsTableView: UITableView!
    
    /* _____________________  Contructor Injection ______________________ */
    let vModel = ViewModel.init(network: NetWorkClass())
    
    var data = [EmailAccount]()

    func getDetails() -> [EmailAccount] {
        return [Gmail(), Yahoo(), Outlook()]
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.commentsTableView.tableFooterView = UIView()
        getComments()
    }

    func getComments(){
        
        /* _____________________  Property Injection ______________________ */
//        vModel.netWorkClass = NetWorkClass()
    
        vModel.getComments { success in
            DispatchQueue.main.async {
                self.commentsTableView.reloadData()
            }
        }
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return self.vModel.modelArray.count
//        default:
//           return self.getDetails().count
//        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommentsTableViewCell.self)) as? CommentsTableViewCell else{return UITableViewCell()}
        switch indexPath.section {
        case 0:
            if self.vModel.modelArray.count > indexPath.row {
                cell.textLabel?.text = self.vModel.modelArray[indexPath.row].email
            }
        default:
            cell.textLabel?.text = self.getDetails()[indexPath.row].domain
        }
        return cell
    }
    
    
    
}



/* _____________________  Dependency Injection in Classes  ______________________ */
protocol EmailAccount {
    var userName: String {get}
    var domain: String {get}
    var lastEmailReceived: Date {get}
}


struct Gmail : EmailAccount{
    var userName: String {
        return "Jayram"
    }
    
    var domain: String {
        return "jay@gmail.com"
    }
    var lastEmailReceived: Date {
        return Date()
    }
}



struct Yahoo : EmailAccount{
    var userName: String {
        return "Jayram"
    }
    
    var domain: String {
        return "jay@yahoo.com"
    }
    var lastEmailReceived: Date {
        return Date()
    }
}

struct Outlook : EmailAccount{
    var userName: String {
        return "Jayram"
    }
    
    var domain: String {
        return "jay@outlook.com"
    }
    var lastEmailReceived: Date {
        return Date()
    }
}

