//
//  ContentView.swift
//  ControlaTuLana
//
//  Created by Bodgar Espinosa Miranda on 06/08/24.
//

import SwiftUI
import SwiftData
import Balance
import CashSwitchboard
import Common
import DesignSystem
import HistoryBalance
import CashInOut

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject var navigationService: MyCashNavigationService
    
    init() {
        navigationService = ServiceLocator.get((any NavigationService).self) as!MyCashNavigationService
    }
    var body: some View {
        TabView {
            BalanceCoordinator(modelContext: modelContext).start()
                .tabItem {
                    Label("Mi Balance", systemImage: "dollarsign.circle")
                }
                .fullScreenCover(isPresented: $navigationService.isPresentingModal, content: {
                    CashInOutCoordinator(modelContext: modelContext, type: navigationService.typeCashDestination ?? "").start()
                })
            HistoryCoordinator().start()
                .tabItem {
                    Label("Historial", systemImage: "chart.pie")
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: CashSwitchboard.Transaction.self, inMemory: true)
}
