//
//  QuestionController.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/23.
//

import SwiftUI
import CoreData

class QuestionController : ObservableObject{
    
    @Published var question = ""
    @Published var date = Date()
    @Published var isNewData = false
    
    func saveQuestion(context : NSManagedObjectContext){
        
        let newQuestion = Question(context: context)
        newQuestion.question = question
        newQuestion.date = date
        
        // saving data...
        
        do{
            
            try context.save()
            // success means closing view...
            isNewData.toggle()
            question = ""
            date = Date()
        }
        catch{
            print(error.localizedDescription)
        }
    }
}
