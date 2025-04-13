//
//  UIKitProductDetailsVC.swift
//  HybridTask
//
//  Created by Mohamed Elkilany on 12/04/2025.
//

import UIKit
import Combine

class UIKitProductDetailsVC: BaseViewController {

    @IBOutlet weak var navigationBarTitleLbl: UILabel!
    @IBOutlet weak var totalPriceLbl: StandardLabel_Regular16!
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var priceViewLbl: UIView!
    var viewModel = ProductDetailsViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        applyGradientToNavigationBar(customView: navigationBarView)
        viewModel.fetchProductDetails()
        bindViewModel()
        
        
        priceViewLbl.layer.cornerRadius = 18
        priceViewLbl.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        priceViewLbl.layer.masksToBounds = false

        priceViewLbl.layer.shadowColor = UIColor.black.cgColor
        priceViewLbl.layer.shadowOpacity = 0.2
        priceViewLbl.layer.shadowOffset = CGSize(width: 0, height: -2)
        priceViewLbl.layer.shadowRadius = 4
    }
    
    
    func registerCells() {
        registerCell(id: LocalProductTableCell.getName(), tableView: tableView)
        registerCell(id: ImageSliderProductTableCell.getName(), tableView: tableView)
        registerCell(id: ProductDescriptionTableCell.getName(), tableView: tableView)
        registerCell(id: DeliverWithinTableCell.getName(), tableView: tableView)
        registerCell(id: ProductPriceTableCell.getName(), tableView: tableView)
        registerCell(id: SegmentedControlTableCell.getName(), tableView: tableView)
        registerCell(id: HTMLDescriptionTableCell.getName(), tableView: tableView)
        registerCell(id: AdditionalInfoTableCell.getName(), tableView: tableView)
        registerCell(id: CustomerReviewTableCell.getName(), tableView: tableView)
        registerCell(id: ProductColorTableCell.getName(), tableView: tableView)
    }
    
    
    func configureTableView() {
        registerCells()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
  

     func bindViewModel() {
           viewModel.productInfoPublisher
             .sink {  [weak self] product in
                 guard let self = self else { return }
                   guard let product = product else { return }
                 self.navigationBarTitleLbl.text = product.name ?? ""
                 let currancy = product.priceRange?.maximumPrice?.regularPrice?.currency == "YER" ? "ريال جديد" : "USD"
                 self.totalPriceLbl.text = (ArabicNumberFormatter.formattedArabicNumber(product.priceRange?.maximumPrice?.regularPrice?.value ?? 0) + " " +  currancy)
               }
               .store(in: &cancellables)
         
         viewModel.reloadTableSubject.sink { [weak self] in
             self?.tableView.reloadData()
         }
         .store(in: &cancellables)
       }
    
    @IBAction func dissmisActionBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
        
   
}


extension UIKitProductDetailsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let element = viewModel.contentArray[indexPath.row]
        let cellID = (element.type as? ProductDetailsCellType)?.rawValue ?? ""
        let customCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustomCell
        customCell.configure(withModel: element)
        return customCell as! UITableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row: \(indexPath.row)")
    }
}
