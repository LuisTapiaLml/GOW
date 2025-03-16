//
//  HomeViewController.swift
//  GOW
//
//  Created by Rafael Gonzalez on 07/03/25.
//

import UIKit

class HomeViewController: UITableViewController {
    
    @IBOutlet var menuTableView: UITableView!
    
    
    
    let menuOptions : [MenuOption] = [
            MenuOption(
                title:"Videogames",
                image:"gamecontroller.fill",
                segue:"gamesSegue")
            , MenuOption(
                title:"Weapons",
                image:"shield.fill",
                segue:"weaponsSegue")
            , MenuOption(
                title:"Characters",
                image:"person.crop.rectangle.stack.fill",
                segue:"charactersSegue")
            ,MenuOption(
                title:"Merchandise",
                image:"shippingbox.fill",
                segue:"MerchantSegue")
        ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blackBackground
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Configure the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuOptionCell
                // Configure the cell...
                cell.menuLabel.text = menuOptions[indexPath.row].title
                cell.menuImage.image = UIImage(systemName:menuOptions[indexPath.row].image)
        
        guard let customFont = UIFont(name: Constants.fontName, size: UIFont.labelFontSize) else {
            fatalError("""
                Failed to load the "CustomFont-Light" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        cell.menuLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        
        cell.backgroundColor = .blackBackground
        cell.menuLabel.textColor = .text
        
        
        
        cell.menuLabel.adjustsFontForContentSizeCategory = true
        cell.menuLabel.textColor = .gowBlack2
          
                return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: menuOptions[indexPath.row].segue, sender: self)
    }
    

}
