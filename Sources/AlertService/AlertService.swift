//
//  AlertService.swift
//  
//
//  Created by Alert on 08.04.2021.
//

import UIKit

final public class AlertService {
    
    private var topVC: UIViewController? {
        UIApplication.shared.windows.first?.visibleViewController()
    }
    
    private var title   = ""
    private var style   : UIAlertController.Style = .alert
    private var message = ""
    private var actions = [UIAlertAction]()
    private var alert   : UIAlertController?
    
    //MARK: - Default
    public func `default`(title: String, message: String, style: UIAlertController.Style = .alert, completion: @escaping () -> () = {}){
        guard !isAlertPresent() else { return }
        self.title   = title
        self.message = message
        self.style   = style
        self.actions.removeAll()
        self.actions.append(UIAlertAction(title: "Ok", style: .default, handler: { (alert) in
            completion()
        }))
        self.alert = createAlert()
        present(with: alert)
    }
    
    //MARK: -  Warning
    public func warning(title: String, message: String, style: UIAlertController.Style = .alert){
        guard !isAlertPresent() else { return }
        self.title   = title
        self.message = message
        self.style   = style
        self.alert   = createAlert()
        present(with: alert)
    }
    
    //MARK: - Text field
    public func field(title: String, message: String, style: UIAlertController.Style = .alert, completion: @escaping ((String?) -> ()) = {_ in }){
        guard !isAlertPresent() else { return }
        self.title   = title
        self.message = message
        self.style   = style
        self.actions.removeAll()
        self.actions.append(UIAlertAction(title: "Ok", style: .default, handler: { [weak self] (_) in
            guard let self = self else { return }
            completion(self.alert?.textFields?.first?.text)
        }))
        self.alert = createAlert()
        alert?.addTextField(configurationHandler: nil)
        present(with: alert)
    }
    
    //MARK: - Options
    public func options(title: String, message: String, options: AlertButtonOptionsoble, style: UIAlertController.Style = .alert, completion: @escaping ((Int) -> ()) = {_ in }){
        guard !isAlertPresent() else { return }
        self.title   = title
        self.message = message
        self.style   = style
        self.actions.removeAll()
        for button in 0..<options.buttonsCount {
            let action = UIAlertAction(
                title: options.buttonsText[button],
                style: .default,
                handler: { (alert) in
                completion(button)
            })
            self.actions.append(action)
        }
        self.alert = createAlert()
        present(with: alert)
    }
    
    private func present(with alert: UIAlertController?){
        guard !isAlertPresent(), let alert = alert else { return }
        topVC?.present(alert, animated: true)
    }
    
    private func isAlertPresent() -> Bool {
        guard let topVC = topVC else { return false }
        let isAlertController = topVC is UIAlertController
        return isAlertController
    }
    
    private func createAlert() -> UIAlertController {
        let alert = UIAlertController(title  : self.title,
                                      message: self.message,
                                      preferredStyle: self.style)
        self.actions.forEach { action in
            alert.addAction(action)
        }
        return alert
    }
    
    public init(){}
}



