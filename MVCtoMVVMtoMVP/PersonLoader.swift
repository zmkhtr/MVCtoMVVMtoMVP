//
//  PersonLoader.swift
//  MVCtoMVVMtoMVP
//
//  Created by Azam Mukhtar on 16/05/23.
//

import UIKit

class PersonLoader {
    
    func load(completion: @escaping (Swift.Result<[Person], Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            completion(.success([
                Person(name: "Person 1", age: 23, image: UIImage(systemName: "person")!),
                Person(name: "Person 2", age: 12, image: UIImage(systemName: "star")!),
                Person(name: "Person 3", age: 34, image: UIImage(systemName: "pencil")!),
                Person(name: "Person 4", age: 13, image: UIImage(systemName: "rays")!),
                Person(name: "Person 5", age: 45, image: UIImage(systemName: "shower")!),
            ]))
        }
    }
}
