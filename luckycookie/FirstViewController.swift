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
    
    @IBOutlet weak var pagecontrol: UIPageControl!
    
    //MARK:- Vars
       
       let titles = ["Estandar", "Mala Suerte", "Amor", "Dinero", "Proximamente"]
    
       var currentViewControllerIndex = 0
    
       //MARK:- Lifecycle
       
       override func viewDidLoad() {
           super.viewDidLoad()
           setup()
       }

       func setup() {
           guard let pageViewController = storyboard?.instantiateViewController(identifier: String(describing: themesViewController.self)) as? themesViewController else {
               return
           }
        pageViewController.delegate   = self as UIPageViewControllerDelegate
        pageViewController.dataSource = self as UIPageViewControllerDataSource
        
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(pageViewController.view)
          let views: [String: Any] = ["pageView": pageViewController.view!]
        
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
        pagecontrol.currentPage = GlobalVars.currentBolita
        return currentViewControllerIndex
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        pagecontrol.numberOfPages = titles.count
        return titles.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
        let dataViewController = viewController as? DataViewController
        
        guard var currentIndex = dataViewController?.index else { return nil }
        
        currentViewControllerIndex = currentIndex
        if currentIndex == 0 {
            pagecontrol.currentPage = GlobalVars.currentBolita
            return nil
        }
        
        currentIndex -= 1
        pagecontrol.currentPage = GlobalVars.currentBolita
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
        pagecontrol.currentPage = GlobalVars.currentBolita
        return detailViewControllerAt(index: currentIndex)
    }
}
