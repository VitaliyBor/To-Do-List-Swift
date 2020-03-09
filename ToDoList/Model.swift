//
//  Model.swift
//  ToDoList
//
//  Created by Admin on 08/03/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

var ToDoItems: [[String: Any]] {
    set{
        UserDefaults.standard.set(newValue,forKey:"ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    get{
         if let array = UserDefaults.standard.array(forKey:"ToDoDataKey") as? [[String:Any]]{
               return array
           } else{
              return []
           }
    }
    
}
/*[["Name": "call to the mom", "isCompleted": true],["Name":"Develop application","isCompleted": false], ["Name":"start live in the world","isCompleted": false]]
*/
func addItem(nameItem: String, isCompleted: Bool = false){
    ToDoItems.append(["Name": nameItem,"isCompleted":false])
   
}
func moveItem(fromIndex: Int, toIndex:Int){
    
    let from = ToDoItems[fromIndex]
    ToDoItems.remove(at: fromIndex)
    ToDoItems.insert(from,at: toIndex)
}

func removeItem(at index: Int){
    ToDoItems.remove(at: index)
   
}

func changeState(at item: Int) -> Bool{
    ToDoItems[item]["isCompleted"] = !(ToDoItems[item]["isCompleted"] as! Bool)
    
    return ToDoItems[item]["isCompleted"] as! Bool
}

