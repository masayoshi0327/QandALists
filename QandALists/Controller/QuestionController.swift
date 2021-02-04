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
    
    @Published var title = ""
    @Published var solution = ""
    @Published var url = ""
    @Published var isMovePage = false
    @Published var isMoveEdit = false
    @Published var editAnswer : Answer!
    
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
    
    func saveAnswer(q: Question, context : NSManagedObjectContext){
        
        let newAnswer = Answer(context: context)
        newAnswer.title = q.content
        newAnswer.solution = solution
        newAnswer.url = url
        newAnswer.date = date
        context.delete(q)
        
        do{
            try context.save()
            isMovePage.toggle()
            solution = ""
            url = ""
            date = Date()
            
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func isURL(_ str:String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES '[_/:%#$&?()~.=+-A-Za-z0-9]+'")
        return predicate.evaluate(with: str)
    }
    
    func moveAnswerEditor(item: Answer){
            
        editAnswer = item
        title = item.title!
        solution = item.solution!
        url = item.url!
        date = item.date!
        isMoveEdit.toggle()
    }
    
    func updateAnswer(context: NSManagedObjectContext){
                    
        // Means Update Old Date...
        editAnswer.title = title
        editAnswer.solution = solution
        editAnswer.url = url
        
        try! context.save()
        
        // removing updatingItem if successful
        
        editAnswer = nil
        isMoveEdit.toggle()
        title = ""
        solution = ""
        date = Date()
    }
}
