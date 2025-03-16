//
//  WeaponsViewController.swift
//  GOW
//
//  Created by Rafael Gonzalez on 07/03/25.
//

import UIKit

class WeaponsViewController: UIViewController , UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var wTableView: UITableView!
    var arrayWeapons : [Weapon] = []
    //    CGO Weapons
        let cgoWeapons : [Weapon] = [
            Weapon(
                id: 1, name: "Mark 1 Lancer Assault Rifle",
                description: "Dubbed the Retro Lancer during the Lambent Pandemic, was the predecessor to the Mark 2 Lancer Assault Rifle. Formerly the main assault rifle of the Coalition of Ordered Governments Army, the Mark 1 Assault Rifle was used throughout the Pendulum War.",
                poster: "Mark1LancerAssaultRifle"
                ),
            Weapon(
                id: 2, name: "Mark 2 Lancer Assault Rifle",
                description: "An upgrade to the Mark 1 Lancer Assault Rifle, produced with a chainsaw bayonet, increased accuracy, lower recoil, and larger ammunition carrying capacity but less firepower compared to its predecessor.",
                poster: "LancerMk2"
                ),
            Weapon(
                id: 3, name: "Longshot Sniper Rifle",
                description: "Was a high-caliber, single-shot, bolt-action sniper rifle. Created by the Coalition of Ordered Governments during the Pendulum Wars, the Longshot was used even seventeen years after Emergence Day.",
                poster: "LongshotSniperRifle"
                ),
            Weapon(
                id: 4, name: "Hammer of Dawn",
                description: "The Hammer of Dawn was a COG Imulsion-energized, orbital, satellite-based laser. Its key components were invented by the UIR scientist Mauris Ivo and completed by professor Adam Fenix after it was stolen during Operation: Leveler.",
                poster: "HammerOfDawn"
                ),
            Weapon(
                id: 5, name: "MX8 Snub Pistol",
                description: "Was the standard sidearm for Coalition of Ordered Governments armed forces personnel",
                poster: "SnubPistol"
            )
            ]
        
    //    Locus Weapons
        let locusWeapons : [Weapon] = [
            Weapon(
            id: 1, name: "Boomshot Grenade Launcher",
            description: "Was a single-shot, pump-action grenade launcher designed and used primarily by Locust, specifically the Boomer.",
            poster: "Boomshot"
        ),
            Weapon(
                id: 2, name: "Hammerburst II",
                description: "was the Locust standard-issue, high-powered assault rifle. It is often referred to as the Locust counterpart to the COG Lancer Assault Rifle.",
                poster: "HammerburstII"
            ),
        Weapon(
            id: 3, name: "Mulcher",
            description: "The Mulcher is a heavy, hand-cranked, rotary gatling gun developed by the Coalition of Ordered Governments.",
            poster: "Mulcher"
        ),
        Weapon(
            id: 4, name: "Bolo Grenade",
            description: "The Bolo Grenade, otherwise known as the Fragmentation Grenade, was the standard-issue fragmentation grenade used by the Coalition of Ordered Governments, the Locust Horde and the Swarm.",
            poster: "BoloGrenade"
        ),
        Weapon(
            id: 5, name: "Boltok Pistol",
            description: "was the standard-issue sidearm of the Locust, specifically the Drones. The pistol continues the Locust weapon-design philosophy of creating weapons with an emphasis towards brute force.",
            poster: "BoltokPistol"
        )
        ]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        wTableView.dataSource = self
        wTableView.delegate = self
        
        
        
        self.view.backgroundColor = .blackBackground
        wTableView.backgroundColor = .blackBackground
        
        let tabItemTag = self.tabBarItem.tag
        
        if tabItemTag == 0{
            arrayWeapons = cgoWeapons
        }else{
            arrayWeapons = locusWeapons
        }
        
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


extension WeaponsViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayWeapons.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeaponsCell
        
        let weapon = arrayWeapons[indexPath.row]
        
        guard let customFont = UIFont(name: Constants.fontName, size: UIFont.labelFontSize) else {
            fatalError("""
                Failed to load the "CustomFont-Light" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        
        cell.wName.font = UIFontMetrics.default.scaledFont(for: customFont)
        
        
        cell.wName.text = weapon.name
        
        cell.wName.textColor = .gowRed
        
        cell.wDescription.textColor = .gowText
        cell.wDescription.text = weapon.description
        
        cell.wDescription.numberOfLines = 15
        
        cell.wPoster.image = UIImage(named: weapon.poster)
        
        return cell
    }
    
    
    
}
