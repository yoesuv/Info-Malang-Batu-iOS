//
//  Mockable.swift
//  Info Malang BatuTests
//
//  Created by Yusuf Saifudin on 26/05/24.
//

import Foundation

enum MockableError: LocalizedError {
    case fileNotFound(String)
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound(let filename):
            return "JSON file '\(filename).json' not found in test bundle"
        }
    }
}

protocol Mockable: AnyObject {
    
    var bundle: Bundle { get }
    func loadJSON<T: Decodable>(filename: String, type: T.Type) throws -> T
}

extension Mockable {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJSON<T: Decodable>(filename: String, type: T.Type) throws -> T {
        guard let path = bundle.url(forResource: filename, withExtension: "json")
        else {
            throw MockableError.fileNotFound(filename)
        }
        
        let data = try Data(contentsOf: path)
        let decodedObject = try JSONDecoder().decode(type, from: data)
        return decodedObject
    }
}
