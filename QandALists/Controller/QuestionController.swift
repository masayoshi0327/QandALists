//
//  QuestionController.swift
//  QandALists
//
//  Created by 澤崎正佳 on 2021/01/23.
//

import SwiftUI
import CoreData

class QuestionController : ObservableObject{
    
    @Published var content = ""
    @Published var date = Date()
    @Published var isNewData = false
    @Published var updateItem : Question!
    
    func saveQuestion(context : NSManagedObjectContext){
        
        if updateItem != nil{
                    
            // Means Update Old Date...
            updateItem.date = date
            updateItem.content = content
            
            try! context.save()
            
            // removing updatingItem if successful
            
            updateItem = nil
            isNewData.toggle()
            content = ""
            date = Date()
            return
        }
        
        let newQuestion = Question(context: context)
        newQuestion.content = content
        newQuestion.date = date
        
        // saving data...
        
        do{
            
            try context.save()
            // success means closing view...
            isNewData.toggle()
            content = ""
            date = Date()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    func EditItem(item: Question){
            
        updateItem = item
        // togging the newDataView...
        date = item.date!
        content = item.content!
        isNewData.toggle()
    }
}
