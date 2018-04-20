//
//  DetailViewModel.swift
//  AnotherTableView_KL_Class
//
//  Created by Kevin Lopez on 4/19/18.
//  Copyright © 2018 io.ricoLabs. All rights reserved.
//

import Foundation

struct DetailViewModel {
    let title: String
    let description: String
    let imageName: String
}

extension DetailViewModel {
    
    static var shortDesc: String {
        return "There isnt much to see here"
    }
    
    static var longDesc: String {
        return "We need to watch out dfighdfigfbn gidf rig giuhdigh eief iefhg ief ifhj gief gifeh gife gireh giefjhi ij giofj i idjfiido og dojgfog odj god  odjfoj goojo  oj odjfoe fo oj ofj dfogj  odjofj fodf"
    }
    
    static var shortTitle: String {
        return "Squirrel Attacks!"
    }
    
    static var longTitle: String {
        return "Warning! This squirrel attack will last all week so take steps to prepare!"
    }
    
    static var defaultData: [DetailViewModel] {
        var viewModels = [DetailViewModel]()
        
        for i in 1...10 {
            let isDivisibleByTwo = i % 2 == 0
            let description = isDivisibleByTwo ? longDesc : shortDesc
            let title = isDivisibleByTwo ? shortTitle : longTitle
            
            let viewModel = DetailViewModel(title: title, description: description, imageName: "randomImage\(i)")
            viewModels.append(viewModel)
        }
        
        return viewModels
    }
}















