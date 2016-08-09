//
//  Ticket.swift
//  workerPinGo
//
//  Created by Cao Thắng on 8/7/16.
//  Copyright © 2016 thangcao. All rights reserved.
//

import UIKit

class Ticket: NSObject {
    var category: String?
    var title: String?
    var userName: String?
    var urgent: String?
    var workerName: String?
    init(data: AnyObject) {
        category = data["category"] as? String
        title = data["title"] as? String
        userName = data["userName"] as? String
        urgent = data["urgent"] as? String
        workerName = data["workerName"] as? String
    }
}
