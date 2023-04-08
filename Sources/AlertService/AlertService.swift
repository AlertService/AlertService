//
//  AlertService.swift
//  
//
//  Created by Alert on 08.04.2021.
//

import UIKit

final public class AlertService {
    
    public let buttonOptions = AlertButtonOptions()
    
    private var topVC: UIViewController? {
        UIApplication.shared.windows.first?.visibleViewController()
    }
    
    private var title   = ""
    private var style   : UIAlertController.Style = .alert
    private var message = ""
    private var actions = [UIAlertAction]()
    
    private lazy var alert: UIAlertController = {
        let alert = UIAlertController(title  : self.title,
                                      message: self.message,
                                      preferredStyle: self.style)
        self.actions.forEach { action in
            alert.addAction(action)
        }
        return alert
    }()
    
    //MARK: - Default
    public func `default`(title: String, message: String, style: UIAlertController.Style = .alert, completion: @escaping () -> () = {}){
        self.title   = title
        self.message = message
        self.style   = style
        self.actions.removeAll()
        self.actions.append(UIAlertAction(title: "Ok", style: .default, handler: { (alert) in
            completion()
        }))
        present()
    }
    
    //MARK: -  Warning
    public func warning(title: String, message: String, style: UIAlertController.Style = .alert){
        self.title   = title
        self.message = message
        self.style   = style
        present()
    }
    
    //MARK: - Text field
    public func field(title: String, message: String, style: UIAlertController.Style = .alert, completion: @escaping ((String?) -> ()) = {_ in }){
        self.title   = title
        self.message = message
        self.style   = style
        alert.addTextField(configurationHandler: nil)
        self.actions.removeAll()
        self.actions.append(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] (alert) in
            guard let self = self else { return }
            completion(self.alert.textFields?.first?.text)
        }))
        present()
    }
    
    //MARK: - Options
    public func options(title: String, message: String, options: AlertButtonOptions.Types, style: UIAlertController.Style = .alert, completion: @escaping ((Int) -> ()) = {_ in }){
        self.title   = title
        self.message = message
        self.style   = style
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
       present()
    }
    
    private func present(){
        guard !isAlertPresent() else { return }
        topVC?.present(self.alert, animated: true)
    }
    
    private func isAlertPresent() -> Bool {
        guard let topVC = topVC else { return false }
        let alertController = String(describing: Mirror(reflecting: alert).subjectType)
        let topController   = String(describing: Mirror(reflecting: topVC).subjectType)
        let isEqual         = topController.contains(alertController)
        return isEqual
    }
    
    public init(){}
}



