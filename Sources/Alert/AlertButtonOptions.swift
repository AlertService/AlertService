//
//  AlertButtonOptions.swift
//  
//
//  Created by Alert on 08.04.2021.
//

import Foundation

struct AlertButtonOptions {
    
    public func change(type: AlertButtonOptions.Types) -> AlertButtonOptionsoble {
        
        switch type {
            case .InstallTG:
                return AlertButtonTG()
            case .TwoResponse:
                return TwoResponse()
            case .Cancel:
                return AlertButtonCancel()
            case .AddPhoto:
                return AddPhoto()
            case .CameraAccess:
                return CameraAccess()
        }
    }
    enum Types {
        case InstallTG
        case TwoResponce
        case Cancel
        case AddPhoto
        case CameraAccess
    }
}

struct AlertButtonTG: AlertButtonOptionsoble {
    
    var buttonsCount: Int {
        get {
            return buttonsText.count
        }
    }
    var buttonsText = ["Уже установлен", "Установить из App Store", "Отмена"]
}
struct TwoResponse: AlertButtonOptionsoble {
    
    var buttonsCount: Int {
        get {
            return buttonsText.count
        }
    }
    var buttonsText = ["Да", "Нет"]
}

struct AlertButtonCancel: AlertButtonOptionsoble {
    
    var buttonsCount: Int {
        get {
            return buttonsText.count
        }
    }
    var buttonsText = ["Да", "Нет"]
}

struct AddPhoto: AlertButtonOptionsoble {
    
    var buttonsCount: Int {
        get {
            return buttonsText.count
        }
    }
    var buttonsText = ["Библиотека", "Фотопарат", "Отмена"]
}

struct CameraAccess: AlertButtonOptionsoble {
    
    var buttonsCount: Int {
        get {
            return buttonsText.count
        }
    }
    var buttonsText = ["Настройки", "Отмена"]
}

