//
//  ViewController.swift
//  NootropicsSubscriptionBox
//
//  Created by Rick Jacobson on 2/1/21.
//

import UIKit

class OnboardingVC: UIViewController {
    
    var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.currentPage = 0
        return pageControl
    }()
    
    let scrollView: UIScrollView = {
        // Create our reusable? scrollview
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    var container: UIStackView = {
        // Create our reussable? container
        let container = UIStackView()
        container.axis = .horizontal
        container.spacing = 0
        container.distribution = .fillEqually
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add scroll view to superview
        view.addSubview(scrollView)
        setupScrollView()
        scrollView.addSubview(container)
        // Constrain it to superview
        setupContainer()
        
        let pageOne = OnboPageView(message: "We're working on that", imageName: "smortdroog", pageColor: .systemBlue, isLastPage: false)
        let pageTwo = OnboPageView(message: "Something!", imageName: "brainpowah", pageColor: .systemIndigo, isLastPage: false)
        let pageThree = OnboPageView(message: "BLAH", imageName: "brainthonk", pageColor: .systemPurple, isLastPage: true)
        
        pageThree.startButton.addTarget(self, action: #selector(loginSegue), for: .touchUpInside)
        
//        let pageOne = createOnboardingPage(message: "Ready to test the limits of your executive functioning!", imageName: "smortdroog", color: UIColor.systemBlue, isLastPage: false)
//        let pageTwo = createOnboardingPage(message: "Try a new Nootropic in your stack each month, stick with the ones that work!", imageName: "brainpowah", color: UIColor.systemIndigo, isLastPage: false)
//        let pageThree = createOnboardingPage(message: "Start your journey by picking a base of some well known Nootropics!", imageName: "brainthonk", color: UIColor.systemPurple, isLastPage: true)

        let pagesArray = [pageOne, pageTwo, pageThree]
        
        for eachPage in pagesArray {
            eachPage.translatesAutoresizingMaskIntoConstraints = false
            container.addArrangedSubview(eachPage)
            eachPage.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        }
        
        view.addSubview(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        pageControl.numberOfPages = pagesArray.count

    }
    
    func setupScrollView() {
        // Set up scrollview constraints
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.delegate = self
    }

    func setupContainer() {
        // Set up container constraints
        container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        container.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }
    
    @objc func loginSegue() {
        let loginVC = LoginVC()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }

}

extension OnboardingVC: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(round(scrollView.contentOffset.x / scrollView.frame.size.width))
        pageControl.currentPage = page
    }
}

