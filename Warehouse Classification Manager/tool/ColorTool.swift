//
//  colorTool.swift
//  Warehouse Classification Manager
//
//  Created by 娄军伟 on 2019/7/6.
//  Copyright © 2019 fuckplus. All rights reserved.
//

import UIKit

struct ColorTool:UIColor{
    /***********RGB转UICOLOR****************/
    func kRgbColor(red:CGFloat, green:CGFloat, blue:CGFloat) ->UIColor{
        return UIColor.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha:1.0)
    }
    /***********RGBA转UICOLOR****************/
    func kRgbAColor(red:CGFloat, green:CGFloat, blue:CGFloat, aplha:CGFloat) ->UIColor{
        return UIColor.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: aplha)
    }
    
    /******16进制转UICOLOR********/
    func kHexOfColor(hexString:String) ->UIColor{
        var cstr = hexString.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).uppercased() as NSString;
        if(cstr.length<6){
           return UIColor.clear;
        }
        if(cstr.hasPrefix("0X")){
            cstr = cstr.substring(from:2) as NSString
        }
        if(cstr.hasPrefix("#")){
            cstr = cstr.substring(from:1) as NSString
            
        }
        if(cstr.length != 6){
            return UIColor.clear;
        }
        var range = NSRange.init()
        range.location=0
        range.length=2
        //red
        let rStr = cstr.substring(with: range);
        //green
        range.location=2;
        let gStr = cstr.substring(with: range)
        //blue
        range.location=4;
        let bStr = cstr.substring(with: range)
        var r :UInt32=0x0;
        var g :UInt32=0x0;
        var b :UInt32=0x0;
        Scanner.init(string: rStr).scanHexInt32(&r);
        Scanner.init(string: gStr).scanHexInt32(&g);
        Scanner.init(string: bStr).scanHexInt32(&b);
        return UIColor(red:CGFloat(r)/255.0, green:CGFloat(g)/255.0, blue:CGFloat(b)/255.0, alpha:CGFloat(1.0))
    }
    
}
