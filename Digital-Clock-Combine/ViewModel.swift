//
//  ViewModel.swift
//  Digital-Clock-Combine
//
//  Created by 宮本大新 on 2022/11/05.
//

import Combine
import Foundation

final class ViewModel: ObservableObject {
    @Published var time: Date = Date.now

    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()

    private var cancellables = Set<AnyCancellable>()

    init() {
        timer
            .sink { [weak self] date in
                guard let self else { return }
                self.time = Date.now
            }
            .store(in: &cancellables)
    }
}
