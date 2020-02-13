//
//  FirstViewController.swift
//  luckycookie
//
//  Created by Karlo Hurtado on 04/02/20.
//  Copyright © 2020 Karlo Hurtado. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    //MARK:- Outlets
    
    @IBOutlet weak var contentView: UIView!
    
       //MARK:- Vars
       
       let titles = ["New Year's Day", "Epiphany", "Orthodox Christmas Day", "Stephen Foster Memorial Day", "Orthodox New Year", "Lee-Jackson Day", "Robert E. Lee's Birthday", "Confederate Heroes' Day", "Martin Luther King Jr. Day", "Robert E. Lee's Birthday", "Idaho Human Rights Day", "Civil Rights Day", "Chinese New Year", "Kansas Day", "National Freedom Day", "Groundhog Day", "Super Bowl", "Rosa Parks Day", "National Wear Red Day", "Tu Bishvat/Tu B'Shevat", "Lincoln's Birthday", "Lincoln's Birthday", "Valentine's Day", "Statehood Day", "Susan B. Anthony's Birthday", "Elizabeth Peratrovich Day", "Presidents' Day", "Daisy Gatson Bates Day", "Maha Shivaratri", "Shrove Tuesday/Mardi Gras", "Shrove Tuesday/Mardi Gras", "Shrove Tuesday/Mardi Gras", "Ash Wednesday", "Linus Pauling Day", "St. David's Day", "Texas Independence Day", "Casimir Pulaski Day", "Read Across America Day", "Super Tuesday", "Town Meeting Day", "Employee Appreciation Day", "Daylight Saving Time starts", "Holi", "Purim", "St. Patrick's Day", "Evacuation Day", "March Equinox", "Isra and Mi'raj", "Maryland Day", "Prince Jonah Kuhio Kalanianaole Day", "National Vietnam War Veterans Day", "Seward's Day", "César Chávez Day", "Pascua Florida Day", "Palm Sunday", "National Tartan Day", "Maundy Thursday", "Passover (first day)", "Good Friday", "Holy Saturday", "Easter Sunday", "Easter Monday", "Thomas Jefferson's Birthday", "Tax Day", "Father Damien Day", "Last Day of Passover", "Emancipation Day", "Orthodox Good Friday", "Orthodox Holy Saturday", "Orthodox Easter", "Orthodox Easter Monday", "Patriot's Day", "Boston Marathon", "Yom HaShoah", "San Jacinto Day", "National Library Workers' Day", "Oklahoma Day", "Administrative Professionals Day", "Take our Daughters and Sons to Work Day", "Ramadan Starts", "Arbor Day", "Confederate Heroes' Day", "Confederate Memorial Day", "Confederate Memorial Day", "Confederate Heroes' Day observed", "State Holiday", "Yom Ha'atzmaut", "Kentucky Oaks", "Law Day", "Loyalty Day", "Lei Day", "Kentucky Derby", "National Explosive Ordnance Disposal (EOD) Day", "Kent State Shootings Remembrance", "Rhode Island Independence Day", "Cinco de Mayo", "National Nurses Day", "National Day of Prayer", "Truman Day", "Victory in Europe Day", "Military Spouse Appreciation Day", "Mother's Day", "Confederate Memorial Day", "Confederate Memorial Day", "Confederate Memorial Day observed", "Lag BaOmer", "Primary Election Day", "Peace Officers Memorial Day", "National Defense Transportation Day", "Armed Forces Day", "Preakness Stakes", "Lailat al-Qadr", "Emergency Medical Services for Children Day", "Ascension Day", "National Maritime Day", "Harvey Milk Day", "Eid al-Fitr", "Memorial Day", "Jefferson Davis' Birthday", "National Missing Children's Day", "Shavuot", "Pentecost", "Whit Monday", "Statehood Day", "Jefferson Davis' Birthday", "Jefferson Davis' Birthday", "D-Day", "Belmont Stakes", "Trinity Sunday", "Corpus Christi", "Kamehameha Day", "Army Birthday", "Flag Day", "Bunker Hill Day", "Emancipation Day", "Juneteenth", "June Solstice", "West Virginia Day", "American Eagle Day", "Father's Day", "Independence Day observed", "Independence Day", "Nathan Bedford Forrest Day", "Bastille Day", "Pioneer Day", "Parents' Day", "National Korean War Veterans Armistice Day", "Tisha B'Av", "Eid al-Adha", "Colorado Day", "Raksha Bandhan", "Coast Guard Birthday", "Purple Heart Day", "Janmashtami", "Victory Day", "Assumption of Mary", "Bennington Battle Day", "Bennington Battle Day observed", "National Aviation Day", "Muharram", "Ganesh Chaturthi", "Hawaii Statehood Day", "Senior Citizens Day", "Women's Equality Day", "Lyndon Baines Johnson Day", "Labor Day", "California Admission Day", "Patriot Day", "Carl Garner Federal Lands Cleanup Day", "National Grandparents Day", "Constitution Day and Citizenship Day", "Air Force Birthday", "National POW/MIA Recognition Day", "Rosh Hashana", "Rosh Hashana", "National CleanUp Day", "September Equinox", "Emancipation Day", "Native American Day", "Gold Star Mother's Day", "Yom Kippur", "Yom Kippur", "First Day of Sukkot", "Feast of St Francis of Assisi", "Child Health Day", "Last Day of Sukkot", "Leif Erikson Day", "Shmini Atzeret", "Simchat Torah", "Columbus Day", "Columbus Day", "Native Americans' Day", "Indigenous People's Day", "Navy Birthday", "White Cane Safety Day", "Boss's Day", "Navratri", "Sweetest Day", "Alaska Day", "Alaska Day observed", "Dussehra", "The Prophet's Birthday", "Nevada Day", "Halloween", "All Saints' Day", "Daylight Saving Time ends", "New York City Marathon", "All Souls' Day", "Election Day", "Election Day", "Return Day", "Marine Corps Birthday", "Veterans Day", "Diwali/Deepavali", "Thanksgiving Day", "State Holiday", "Presidents' Day", "Lincoln's Birthday/Lincoln's Day", "Day After Thanksgiving", "Family Day", "Acadian Day", "Black Friday", "American Indian Heritage Day", "First Sunday of Advent", "Cyber Monday", "Rosa Parks Day", "St Nicholas Day", "Pearl Harbor Remembrance Day", "Feast of the Immaculate Conception", "Chanukah/Hanukkah (first day)", "Feast of Our Lady of Guadalupe", "National Guard Birthday", "Bill of Rights Day", "Pan American Aviation Day", "Wright Brothers Day", "Last Day of Chanukah", "December Solstice", "Christmas Eve", "Christmas Eve", "Christmas Day", "Kwanzaa (first day)", "Day After Christmas Day", "New Year's Eve"]
    
       var currentViewControllerIndex = 0
    
       //MARK:- Lifecycle
       
       override func viewDidLoad() {
           super.viewDidLoad()
           setup()
           // Do any additional setup after loading the view.
       }

       func setup() {
           guard let pageViewController = storyboard?.instantiateViewController(identifier: String(describing: themesViewController.self)) as? themesViewController else {
               return
           }
        pageViewController.delegate  = self as! UIPageViewControllerDelegate
        pageViewController.dataSource = self as! UIPageViewControllerDataSource
        
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(pageViewController.view)
        let views: [String: Any] = ["pageView": pageViewController.view]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageView]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageView]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
        
        guard let startingViewController = detailViewControllerAt(index: currentViewControllerIndex) else {
            return
        }
        
        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        
        
    }
    
    func detailViewControllerAt(index: Int) -> DataViewController? {
        
        if index >= titles.count || titles.count == 0 {
            return nil
        }
        
        guard let dataViewController = storyboard?.instantiateViewController(withIdentifier:  String(describing: DataViewController.self)) as? DataViewController else { return nil
        }
        dataViewController.index = index
        dataViewController.currentTitle = titles[index]
        
        return dataViewController
    }
}

extension FirstViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentViewControllerIndex
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return titles.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
        let dataViewController = viewController as? DataViewController
        
        guard var currentIndex = dataViewController?.index else { return nil }
        
        currentViewControllerIndex = currentIndex
        
        if currentIndex == 0 {
            return nil
        }
        
        currentIndex -= 1
        
        return detailViewControllerAt(index: currentIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
        let dataViewController = viewController as? DataViewController
        
        guard var currentIndex = dataViewController?.index else { return nil }
        
        if currentIndex == titles.count {
            return nil
        }
        
        currentIndex += 1
        
        currentViewControllerIndex = currentIndex
        
        return detailViewControllerAt(index: currentIndex)
    }
}
