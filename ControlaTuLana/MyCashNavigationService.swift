//
//  MyCashNavigationService.swift
//  ControlaTuLana
//
//  Created by Bodgar Espinosa Miranda on 14/10/24.
//

import Foundation
import CashSwitchboard
import Common

public class MyCashNavigationService: NavigationService {
    @Published public var navigationState = NavigationState()
    
    @Published public var path: [Destination] = []
    @Published public var isPresentingModal: Bool = false
    @Published public var modalDestination: Destination?
    @Published public var typeCashDestination: String?
    
    public var id = UUID()
    
    public func navigate(to destination: Destination) {
        guard let destination = destination as? CashDestination else {
            return
        }
        
        switch destination {
        case .balance:
            modalDestination = destination
            isPresentingModal = false
        case .cashInOut(let type):
            modalDestination = destination
            isPresentingModal = true
            typeCashDestination = type
        case .historyBalance:
            break
        }
    }
    
    public func presentModal(to destination: Destination) {
        modalDestination = destination
        isPresentingModal = true
    }
    
    public func dismissModal() {
        isPresentingModal = false
        modalDestination = nil
    }
}
