//
//  AdditionalInfoTableCell.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 13/04/2025.
//

import UIKit

class AdditionalInfoTableCell: UITableViewCell,CustomCell {
    
  @IBOutlet weak var additionalInfoTableView: UITableView!

    var viewModel: ProductDetailsViewModel? 
    var itemModel: Item?
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        configureTableView()
    }
    
    func registerCells() {
        let id = InfoTableCell.getName()
        let nib = UINib(nibName: id, bundle: .main)
        additionalInfoTableView.register(nib, forCellReuseIdentifier: id)
    }
    
    func configureTableView() {
        registerCells()
        additionalInfoTableView.delegate = self
        additionalInfoTableView.dataSource = self
        additionalInfoTableView.separatorStyle = .none
    }
    
    
    func configure(withModel model: any CustomCellEntity) {
        let cellEntity = model as? ProductDetailsCellEntity
        let entityViewModel = cellEntity?.viewModel as? ProductDetailsViewModel
        viewModel = entityViewModel
        if  let modelData = cellEntity?.model as? Item {
            print("additionalInfoTableCell:-", modelData.attributes ?? [] )
            self.itemModel = modelData
        }
    }
    
}


extension AdditionalInfoTableCell:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemModel?.attributes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableCell.getName(), for: indexPath) as? InfoTableCell else {
            return UITableViewCell()
        }
        
        if let attribute = itemModel?.attributes?[indexPath.row] {
            cell.configure(with: attribute)
        }
        
        return cell
    }
    
    
}
