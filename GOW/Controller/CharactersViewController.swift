//
//  CharactersViewController.swift
//  GOW
//
//  Created by Luis Enrique Perez Tapia on 16/03/25.
//

import UIKit

class CharactersViewController: UIViewController {
    
    
    var characters: [Character] = []
    
    
    let CGOCharacters :[Character] = [
        Character(name: "Marcus Michael Fenix", image: "https://res.cloudinary.com/dslnjpd7t/image/upload/v1742109996/gow/characters/Oldmarcusarmored_vw2qwr.webp"),
        Character(name: "Dominic Santiago", image: "https://res.cloudinary.com/dslnjpd7t/image/upload/v1742109991/gow/characters/Gears_of_War_3_Personajes_COG_Dom_V2_srtvqb.webp" ),
        Character(name:"Anya Stroud",image: "https://res.cloudinary.com/dslnjpd7t/image/upload/v1742109987/gow/characters/Anya_Stroud_infobox_OP5_G5_yhhcru.webp"),
        Character(name:"Damon Baird", image:"https://res.cloudinary.com/dslnjpd7t/image/upload/v1742109987/gow/characters/Baird_Armadura_Invernal_render_G5_m4n4yk.webp"),
        Character(name: "Benjamin Carmine", image: "https://res.cloudinary.com/dslnjpd7t/image/upload/v1742109989/gow/characters/Benjamin_Carmine_infobox_G5_yxzo8j.webp"),
    ]
    
    let locusCharacters : [Character] = [
        Character(name: "Myrrah", image: "https://res.cloudinary.com/dslnjpd7t/image/upload/v1742109994/gow/characters/Myrrah_infobox_ni6in2.webp"),
        Character(name: "RAAM", image: "https://res.cloudinary.com/dslnjpd7t/image/upload/v1742109999/gow/characters/RAAM_Infobox_rogqru.webp"),
        Character(name: "Jermad", image: "https://res.cloudinary.com/dslnjpd7t/image/upload/v1742109992/gow/characters/Jermad_Infobox_G5_hsds5d.webp"),
        Character(name: "Skorge", image: "https://res.cloudinary.com/dslnjpd7t/image/upload/v1742110001/gow/characters/Skorge_G5_Infobox_jd9mck.webp"),
        Character(name: "Ukkon", image: "https://res.cloudinary.com/dslnjpd7t/image/upload/v1742110002/gow/characters/Ukkon_Infobox_hcprjs.webp"),
        
    ]
    
    private let tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .insetGrouped )
        
        
        tableView.allowsSelection = true
        
        tableView.backgroundColor = .gowBlack1
                
        tableView.register( CharactersCell.self , forCellReuseIdentifier: CharactersCell.identifier )
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tabItemTag = self.tabBarItem.tag
        
        if tabItemTag == 0{
            characters = CGOCharacters
        }else{
            characters = locusCharacters
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setupUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func setupUI() {
        
        self.view.backgroundColor = .gowBlack1
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.backgroundColor = .gowBlack1
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor ),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor ),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor ),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor )
            
        ])
        
        
            
    }

    
}




extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return characters.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CharactersCell.identifier , for: indexPath) as! CharactersCell
        
        let character =  characters[indexPath.row]
        
        guard let customFont = UIFont(name: Constants.fontName, size: UIFont.labelFontSize) else {
            fatalError("""
                Failed to load the "CustomFont-Light" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        
        cell.characterName.font = UIFontMetrics.default.scaledFont(for: customFont)
        
        
        cell.characterImage.loadImage(from: URL(string: (character.image))!)
            

        cell.characterName.text = character.name
            
        return cell
            
       
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
        
    
}
