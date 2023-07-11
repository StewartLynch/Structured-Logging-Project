//
// Created for MyToDos
// by  Stewart Lynch on 2023-07-10
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on Twitter: https://twitter.com/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch

import Foundation

public enum Debug: String {
    case info = "ℹ️"
    case error = "🪲"
    
    public static func print(_ items: Any...,
                       type: Debug,
                       extended: Bool = false,
                       fileID: String = #fileID,
                       function: String = #function,
                       line: Int = #line) {
        Swift.print(type.rawValue,items.map{ "\($0)" }.joined(separator: " "))
        if extended {
            Swift.print(
            """
            \(fileID)
            function: \(function)
            line: \(line)
            ___________________________
            """
            )
        }
    }
}
