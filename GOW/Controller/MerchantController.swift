//
//  MerchantController.swift
//  GOW
//
//  Created by Luis Enrique Perez Tapia on 15/03/25.
//

import UIKit

class MerchantController: UIViewController {
    
    
    let products :[Product] = [
        Product(name: "Playera Basica Logo", price: 250 , image: "https://res.cloudinary.com/dslnjpd7t/image/upload/v1742106579/gow/playera_1_y8rd6w.jpg" ),
        
        Product(name: "Playera Gris", price: 200, image: "https://res.cloudinary.com/dslnjpd7t/image/upload/v1742106578/gow/Playera2_zqzset.jpg"),
        Product(name: "Playera Gris 2", price: 150, image:"https://res.cloudinary.com/dslnjpd7t/image/upload/v1742106578/gow/playera_3_ylqhs0.jpg"),
        Product(name: "Collar placas", price: 550, image: "https://res.cloudinary.com/dslnjpd7t/image/upload/v1742106576/gow/articulo_1_v1f2ov.jpg"),
        Product(name: "Taza judgment", price: 350, image: "https://res.cloudinary.com/dslnjpd7t/image/upload/v1742106575/gow/articulo_2_qdugfl.jpg"),
        Product(name: "Sudadera", price: 599.99, image: "https://res.cloudinary.com/dslnjpd7t/image/upload/v1742106575/gow/articulo_3_zjn6vb.webp")
        
    ]
    
    
    private let tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .insetGrouped )
        
        
        tableView.allowsSelection = true
        
        tableView.backgroundColor = .gowBlack1
                
        tableView.register( MerchantCell.self , forCellReuseIdentifier: MerchantCell.identifier )
        return tableView
        
    }()

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        
        self.view.backgroundColor = .gowBlack1
        
        self.tableView.backgroundColor = .gowBlack1
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor ),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor ),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor ),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor )
            
        ])
        
        
            
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



extension MerchantController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return products.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MerchantCell.identifier , for: indexPath) as! MerchantCell
        
        
        let product = products[indexPath.row]
            
        cell.merchantImage.loadImage(from: URL(string: (product.image))!)
            
        cell.merchantPrice.text = "$\(product.price)"
            
        cell.merchantName.text = product.name
            
        
        return  cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
    
}


extension UIImageView {
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error downloading image: \(error.localizedDescription)")
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("No image data found")
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
    
