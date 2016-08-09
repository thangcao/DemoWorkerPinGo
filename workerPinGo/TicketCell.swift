//
//  ticketCell.swift
//  workerPinGo
//
//  Created by Cao Thắng on 8/7/16.
//  Copyright © 2016 thangcao. All rights reserved.
//

import UIKit

class TicketCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var urgentLabel: UILabel!
    
    @IBOutlet weak var workerNameLabel: UILabel!
    
    @IBOutlet weak var buttonApply: UIButton!
    var workerName: String?
    var ticket: Ticket? {
        didSet {
            categoryLabel.text  = "Categpry : \(ticket!.category!)"
            userNameLabel.text = "UserName: \(ticket!.userName!)"
            urgentLabel.text = ticket!.urgent!
            titleLabel.text = "Title: \(ticket!.title!)"
            workerNameLabel.text = ticket!.workerName!
            if ticket!.workerName! == workerName! {
                buttonApply.hidden = true
                workerNameLabel.textColor = UIColor.greenColor()
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func applyAction(sender: UIButton) {
        SocketManager.sharedInstance.applyTicket(workerName!, ticketTitle: ticket!.title!)
    }
}
