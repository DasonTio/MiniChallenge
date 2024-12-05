//
//  CollectionView.swift
//  MiniChallenge
//
//  Created by Dason Tiovino on 04/12/24.
//
// HomeView.swift
import UIKit

class HomeViewController: UIViewController{
    let viewControllerView = HomeView()
    
    override func loadView() {
        self.view = viewControllerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

#Preview{
    HomeView()
}
