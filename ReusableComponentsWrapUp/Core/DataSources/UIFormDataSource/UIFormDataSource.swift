//
//  UIFormDataSource.swift
//  ReusableComponentsWrapUp
//
//  Created by Alejandro Orozco Builes on 4/9/19.
//  Copyright © 2019 Alejandro Orozco Builes. All rights reserved.
//

import UIKit

typealias TableViewDataSource = UITableViewDataSource & UITableViewDelegate

protocol UIFormDataSourceDelegate {
    func formCompleted(completed: Bool) -> ()
}

class UIFormDataSource<T: UIFormElement>: NSObject, TableViewDataSource {

    private var values: [UIFormElement] = []
    private var delegate: UIFormDataSourceDelegate?

    init(_ values: [UIFormElement], tableView: UITableView) {
        self.values = values
        tableView.register(UINib(nibName: "ReusableTableViewCell", bundle: .main), forCellReuseIdentifier: "ReusableTableViewCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableTableViewCell") as! ReusableTableViewCell
        cell.configure(with: values[indexPath.row])
        return cell
    }
}
