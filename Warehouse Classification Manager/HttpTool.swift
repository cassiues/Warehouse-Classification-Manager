//
//  HttpTool.swift
//  Warehouse Classification Manager
//
//  Created by 娄军伟 on 2019/7/6.
//  Copyright © 2019 fuckplus. All rights reserved.
//

import UIKit

class HttpTool: NSObject {
    //Swift4.0 闭包类型：(参数列表)->(返回类型)
    func loadData(callBack:@escaping (_ jsonData:String)->()){
        //1 异步加载数据
        DispatchQueue.global().async {
            print("正在加载数据中...")
            
            //2 拿到网络加载的数据
//            var jsonData = [Person]()
//            for i in 0..<10 {
//                let p = Person()
//                p.name = "zhang - \(i)"
//                p.phone = "188" + String(format: "%08d", arc4random_uniform(1000))
//                p.title = "boss"
//                jsonData(p)
//            }
            
            //3 回到主线程
            DispatchQueue.main.async(execute: {
                // 回调, 执行闭包
                callBack("数据")
            })
            
        }
        
    }
}
