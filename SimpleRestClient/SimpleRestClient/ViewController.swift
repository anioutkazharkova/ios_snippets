//
//  ViewController.swift
//  SimpleRestClient
//
//  Created by Admin on 26.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendRequest(sender: AnyObject) {
        
        let newTodo = Todo()
        newTodo.title = "New todo"
    newTodo.id = 1
        newTodo.userId = 12
        newTodo.completed = true
        newTodo.body = "Todo body"
      
        print(JsonHelper().serialize(newTodo))
        RestClient().processRequest("todos", data: newTodo.serialize(), callback: processCreateCallback, method: .POST)
        
              
    }
    func processCallback(json: String)->()
    {
     let result = JsonHelper().deserialize(Todo.self, json: json)
        print(result.description)
    }
    func processCreateCallback(json: String)
    {
        let result = JsonHelper().deserialize(Todo.self, json: json)
        print(result.id)
    }
}

