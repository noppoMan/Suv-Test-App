//
//  main.swift
//  SuvTestApp
//
//  Created by Yuki Takei on 4/5/16.
//  Copyright © 2016 MikeTOKYO. All rights reserved.
//

import Suv

if Cluster.isWorker {
    Process.on { ev in
        if case .Message(let message) = ev {
            var i = Int(message)!
            i+=1
            Process.send(.Message("\(i)"))
        }
    }
    Loop.defaultLoop.run()
}
