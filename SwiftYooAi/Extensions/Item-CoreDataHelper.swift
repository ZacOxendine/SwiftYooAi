//
//  Item-CoreDataHelper.swift
//  SwiftYooAi
//
//  Created by Zachary Oxendine on 10/28/20.
//

import Foundation

extension Item {
    enum SortOrder {
        case optimized, title, creationDate
    }

    var itemTitle: String {
        title ?? NSLocalizedString("New Item", comment: "Create a New Item")
    }

    var itemDetail: String {
        detail ?? ""
    }

    var itemCreationDate: Date {
        creationDate ?? Date()
    }

    static var example: Item {
        let controller = DataController.preview
        let viewContext = controller.container.viewContext

        let item = Item(context: viewContext)
        item.title = "Example Item"
        item.detail = "This is an example item."
        item.priority = 3
        item.creationDate = Date()

        return item
    }
}
