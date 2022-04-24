//
//  DataModel.swift
//  SwiftUINavigationExperiment
//
//  Created by Alex Seifert on 24.04.22.
//

import Foundation

struct DataModel {
    var id: Int
    var title: String
}

func getData() -> [DataModel] {
    return [
        DataModel(id: 1, title: "Object 1"),
        DataModel(id: 2, title: "Object 2"),
        DataModel(id: 3, title: "Object 3"),
        DataModel(id: 4, title: "Object 4"),
    ]
}
