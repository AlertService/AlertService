//
//  AlertService.swift
//  
//
//  Created by Alert on 08.04.2021.
//

import UIKit

final class AlertService {
    
    public let buttonOptions = AlertButtonOptions()
    
    private var topVC: UIViewController? {
        UIApplication.shared.windows.first?.visibleViewController()
    }
    
    private var title   = ""
    private var message = ""
    private var actions = [UIAlertAction]()
    
    private lazy var alert: UIAlertController = {
        let alert = UIAlertController(title  : self.title,
                                      message: self.message,
                                      preferredStyle: .alert)
        self.actions.forEach { action in
            alert.addAction(action)
        }
        return alert
    }()
    
    //MARK: - Default
    public func `default`(title: String, message: String, completion: @escaping () -> () = {}){
        self.title   = title
        self.message = message
        self.actions.removeAll()
        self.actions.append(UIAlertAction(title: "Ok", style: .default, handler: { (alert) in
            completion()
        }))
        topVC?.present(self.alert, animated: true)
    }
    
    //MARK: -  Warning
    public func warning(title: String, message: String){
        self.title   = title
        self.message = message
        topVC?.present(self.alert, animated: true)
    }
    
    //MARK: - Text field
    public func field(title: String, message: String, completion: @escaping ((String?) -> ()) = {_ in }){
        self.title   = title
        self.message = message
        alert.addTextField(configurationHandler: nil)
        self.actions.removeAll()
        self.actions.append(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] (alert) in
            guard let self = self else { return }
            completion(self.alert.textFields?.first?.text)
        }))
        topVC?.present(self.alert, animated: true)
    }
    
    //MARK: - Options
    public func options(title: String, message: String, options: AlertButtonOptions.Types, completion: @escaping ((Int) -> ()) = {_ in }){
        self.title   = title
        self.message = message
        self.actions.removeAll()
        let options: AlertButtonOptionsoble = buttonOptions.change(type: options)
        for button in 0..<options.buttonsCount {
            let action = UIAlertAction(
                title: options.buttonsText[button],
                style: .default,
                handler: { (alert) in
                completion(button)
            })
            self.actions.append(action)
        }
        topVC?.present(self.alert, animated: true)
    }
    public init(){}
}



