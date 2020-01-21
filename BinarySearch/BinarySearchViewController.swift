//
//  ViewController.swift
//  BinarySearch
//
//  Created by Naveen Chandra on 21/01/20.
//  Copyright © 2020 Naveen Chandra. All rights reserved.
//

import UIKit


//struct for passing into binary search
struct MyObject: Comparable {
    
    let rank: Int
    
    //for swift compiler older than 4.1
    static func == (lhs: MyObject, rhs: MyObject) -> Bool {
        return lhs.rank == rhs.rank
    }
    
    static func < (lhs: MyObject, rhs: MyObject) -> Bool {
        return lhs.rank < rhs.rank
    }
    
    
}

class BinarySearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //example of binary search
        //create a random array
        var randomArray =  (0..<100).map{ _ in Int.random(in: 1 ... 99) }
        //sort
        randomArray.sort()
        print(randomArray)
        //genarate a random variable in the range of array
        let randomInt = Int.random(in: 1..<100)
        print(randomInt)
        //use our binary sort algo
        print(self.binarySearch(in: randomArray, for: randomInt) ??  "not in array")
        
        
        // example of binary search for objects
        var randomArrayOfCustomObjects =  (0..<100).map{ _ in MyObject(rank: Int.random(in: 1 ... 99)) }
        //sort
        randomArrayOfCustomObjects.sort()
        print(randomArrayOfCustomObjects)
        //genarate a random variable in the range of array
        let randomObjectToPass = randomArrayOfCustomObjects.randomElement()
        print(randomObjectToPass)
        //use our binary sort algo
        print(self.binarySearch(in: randomArrayOfCustomObjects, for: randomObjectToPass!) ??  "not in array")
    }
    
    
    func binarySearch<T: Comparable>(in objectArray: [T], for value: T) -> Int?
    {
        
        var left = 0
        var right = objectArray.count - 1
        
        while left <= right {
            
            let middle = Int(floor(Double(left + right) / 2.0))
            
            if objectArray[middle] < value {
                left = middle + 1
            } else if objectArray[middle] > value {
                right = middle - 1
            } else {
                return middle
            }
        }
        
        return nil
    }
    
    
}

