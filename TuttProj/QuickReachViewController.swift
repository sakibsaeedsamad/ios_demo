//
//  QuickReachViewController.swift
//  TuttProj
//
//  Created by Era-MobileApp on 26/2/23.
//

import UIKit

class QuickReachViewController: UIViewController {

    @IBOutlet weak var popularServiceCollectionView: UICollectionView!
    var popularServices: [PopularService] = [
        .init(id: "0", name: "Fund Transfer"),
        .init(id: "1", name: "MFS"),
        .init(id: "2", name: "Bill Pay"),
        .init(id: "3", name: "NPSB"),
        .init(id: "4", name: "EFT")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerCells();
    }
    
    private func registerCells(){
        popularServiceCollectionView.register(UINib(nibName:PopularServiceViewCell.identifier, bundle: nil),forCellWithReuseIdentifier: PopularServiceViewCell.identifier)
    }
    

}

extension QuickReachViewController: UICollectionViewDelegate,
                                    UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularServices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularServiceViewCell.identifier, for: indexPath) as! PopularServiceViewCell
        
        cell.setup(popularService: popularServices[indexPath.row])
        
        return cell
    }
}
