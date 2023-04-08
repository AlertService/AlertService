//
//  AlertButtonOptions.swift
//  
//
//  Created by Alert on 08.04.2021.
//

import Foundation

public struct AlertButtonOptions {
    
    public func change(type: AlertButtonOptions.Types) -> AlertButtonOptionsoble {
        
        switch type {
            case .InstallTG:
                return AlertButtonTG()
            case .TwoResponse:
                return TwoResponse()
            case .AddPhoto:
                return AddPhoto()
            case .CameraAccess:
                return CameraAccess()
        }
    }
    public enum Types {
        case InstallTG
        case TwoResponse
        case AddPhoto
        case CameraAccess
    }
}

public struct AlertButtonTG: AlertButtonOptionsoble {
    
    public var buttonsCount: Int {
        get {
            return buttonsText.count
        }
    }
    public var buttonsText = ["Уже установлен", "Установить из App Store", "Отмена"]
}
public struct TwoResponse: AlertButtonOptionsoble {
    
    public var buttonsCount: Int {
        get {
            return buttonsText.count
        }
    }
    public var buttonsText = ["Да", "Нет"]
}

public struct AddPhoto: AlertButtonOptionsoble {
    
    public var buttonsCount: Int {
        get {
            return buttonsText.count
        }
    }
    public var buttonsText = ["Библиотека", "Фотопарат", "Отмена"]
}

public struct CameraAccess: AlertButtonOptionsoble {
    
    public var buttonsCount: Int {
        get {
            return buttonsText.count
        }
    }
    public var buttonsText = ["Настройки", "Отмена"]
}

