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
    
    weak var delegate: PersonViewDelegate?
    
    func load() {
        delegate?.onLoadingStateChange(isLoading: true)
        delegate?.onErrorStateChange(error: nil)
        
        loader.load { [weak self] result in
            guard let self = self else { return }
            self.delegate?.onLoadingStateChange(isLoading: false)
            
            switch result {
            case let .success(persons):
                self.delegate?.onPersonsLoad(persons: persons)
            case .failure:
                self.delegate?.onErrorStateChange(error: "Error Fetching Data")
            }
        }
    }
}
