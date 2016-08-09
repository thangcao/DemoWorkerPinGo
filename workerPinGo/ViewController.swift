//
//  ViewController.swift
//  workerPinGo
//
//  Created by Cao Thắng on 8/7/16.
//  Copyright © 2016 thangcao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wokerNameTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var tickets = [Ticket]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(animated: Bool) {
        SocketManager.sharedInstance.getTicket { (ticket) in
            print(ticket.category)
            var isUpdateTicket = false
            for itemTicket in self.tickets {
                if itemTicket.title == ticket.title  && ticket.workerName == self.wokerNameTextField.text! {
                    itemTicket.workerName = self.wokerNameTextField.text!
                    isUpdateTicket = true
                    break
                }
            }
            for itemTicket in self.tickets {
                print(itemTicket.workerName)
            }
            if !isUpdateTicket {
                self.tickets.append(ticket)
            }
            
            self.tableView.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("TicketCell") as! TicketCell
        cell.workerName = wokerNameTextField.text!
        cell.ticket = tickets[indexPath.row]
        return cell
    }
}

