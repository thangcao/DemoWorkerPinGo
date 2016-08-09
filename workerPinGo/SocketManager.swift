//
//  SocketManager.swift
//  workerPinGo
//
//  Created by Cao Thắng on 8/7/16.
//  Copyright © 2016 thangcao. All rights reserved.
//

import UIKit
import SocketIOClientSwift
class SocketManager: NSObject {
    static let sharedInstance = SocketManager()
    var socket: SocketIOClient = SocketIOClient(socketURL: NSURL(string: "http://192.168.1.63:3000")!)
    
    override init() {
        super.init()
    }
    
    func establishConnection() {
        socket.connect()
    }
    
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func applyTicket(workerName: String, ticketTitle: String){
        print("applyTicket-\(ticketTitle)")
        socket.emit("applyTicket-\(ticketTitle)", workerName)
    }
    
    func getTicket(success: (ticket: Ticket)-> Void) {
        socket.on("newTicketForCategoryA") { (dataArray, socketAck) -> Void in
            let item = dataArray[0]
            let ticket = Ticket(data: item)
            success(ticket: ticket)
        }
    }
    
    func pushNewTicketForCategory (ticket: Ticket){
        //category, title, urgent, userName
        socket.emit("pushTicketForCategoryA", ticket.category!, ticket.title!, ticket.urgent!, ticket.userName!)
    }
 
}
