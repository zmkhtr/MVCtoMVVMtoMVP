//
//  PersonViewModel.swift
//  MVCtoMVVMtoMVP
//
//  Created by Azam Mukhtar on 16/05/23.
//

import Foundation

class PersonViewModel {
    
    private let loader = PersonLoader()
    
    var onLoadingStateChange: ((Bool) -> Void)?
    var onErrorStateChange:((String?) -> Void)?
    var onPersonsLoad: (([Person]) -> Void)?
    
    
    func load() {
        onLoadingStateChange?(true)
        onErrorStateChange?(nil)
        
        loader.load { [weak self] result in
            guard let self = self else { return }
            self.onLoadingStateChange?(false)
            
            switch result {
            case let .success(persons):
                self.onPersonsLoad?(persons)
            case .failure:
                self.onErrorStateChange?("Error Fetching Data")
            }
        }
    }
}
