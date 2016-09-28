
//
//  Repository.swift
//  SwiftCore
//
//  Created by Admin on 28.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation
import RealmSwift


public class Repository<T:BaseTable>
{
  private  let realm:Realm
    
    
    private init()
    {
        self.realm = try! Realm()
    }

    public static func create()->Repository<T>
    {
        return Repository<T>()
    }
    
    public func save(object: T)->()
    {
        try! realm.write {
            objc_sync_enter(self)
            object.id = getPKValue()
            realm.add(object)
            objc_sync_exit(self)
        }
    }
    private func getPKValue()->Int
    {
        var index = 0
        if let last = getLast()
        {
            index = last.id
        }
        return (index + 1)
    }
    public func getLast()->T?
    {
      let results = realm.objects(T.self)
      if (results.count>0)
      {
        return results.last
        }
return nil
    }
    public func getFirst()->T?
    {
        let results = realm.objects(T.self)
        if (results.count>0)
        {
            return results.first
        }
        return nil
    }
    public func saveList(list: [T])->()
    {
        try! realm.write {
            objc_sync_enter(self)
            realm.add(list)
            objc_sync_exit(self)
        }
    }
    public func getList()->[T]
    {
    var list=[T]()
        let results = realm.objects(T.self)
        if (results.count>0)
        {
            list.appendContentsOf(results)
        }
        return list
    }
    public func getFiltered(filter: NSPredicate)->[T]
    {
        let results = realm.objects(T.self).filter(filter)
        var list=[T]()
        if (results.count>0)
        {
            list.appendContentsOf(results)
        }
        return list
    }
    public func removeAll()
    {
         let results = realm.objects(T.self)
        try! realm.write{
            objc_sync_enter(self)
            for i in 0..<results.count
            {
                realm.delete(results[i])
            }
            objc_sync_exit(self)
        }
    }
}


