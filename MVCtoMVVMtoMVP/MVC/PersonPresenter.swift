//
//  PersonViewModel.swift
//  MVCtoMVVMtoMVP
//
//  Created by Azam Mukhtar on 16/05/23.
//

import Foundation

protocol PersonViewDelegate: AnyObject {
    func onLoadingStateChange(isLoading: Bool)
    func onErrorStateChange(error: String?)
    func onPersonsLoad(persons: [Person])
}

class PersonPresenter {
    private let loader = PersonLoader()
    
    func load() {
        
        loader.load { [weak self] result in
            guard let self = self else { return }
        }
    }
}
