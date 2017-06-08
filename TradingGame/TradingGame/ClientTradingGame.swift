//
//  ClientTradingGame.swift
//  TradingGame
//
//  Created by Fernando Pacheco on 6/7/17.
//  Copyright © 2017 Jessica Douma. All rights reserved.
//

import Foundation
import SwiftSocket

class ClientTradingGame {
    let name: String!
    let client: TCPClient!
    
    var purse = 0
    var gems = [String:Int]()
    var chips = [String:Int]()
    var clues = [String]()
    
    init(connect clientName: String, toHost host: String, onPort port: Int) {
        name = clientName
        
        client = TCPClient(address: host, port: Int32(port))
        
        switch client.connect(timeout: 10) {
        case .success:
            print("Connected to host \(client.address)")
        case .failure(let error):
            print(String(describing: error))
        }
    }
    
    deinit {
        client.close()
    }
    
    open func write(message: String) {
        let byteMessage = prepareMessage(message: message)
        
        switch client.send(data: byteMessage) {
        case .success:
            print("Message: \(message) sent!")
        case .failure(let error):
            print(String(describing: error))
        }
    }
    
    open func read() -> String? {
        guard let byteResponse = client.read(1024 * 10) else {
            return nil
        }
        
        guard let response = String(bytes: byteResponse, encoding: .utf8) else {
            return nil
        }
        
        return decodeResponse(response: response)
    }
    
    private func prepareMessage(message: String) -> [Byte] {
        var buffer: [Byte] = Array(message.utf8)
        
        // Add virtual newline \r\n
        buffer.append(13)
        buffer.append(10)
        
        return buffer
    }
    
    private func decodeResponse(response: String) -> String? {
        let responseArr = response.components(separatedBy: ":")
        let event = responseArr[0]
        let data = responseArr[1]
        
        if event  == "ITEMS" {
            addInventory(items: data.components(separatedBy: ";"))
        }
        
        return data
    }
    
    private func addInventory(items: [String]) {
        // Add chips
        chips["Red"] = Int(items[0])
        chips["White"] = Int(items[1])
        chips["Blue"] = Int(items[2])
        
        // Add gems
        gems["Onyx"] = Int(items[3])
        gems["Emeralds"] = Int(items[4])
        gems["Pearls"] = Int(items[5])
        
        // Add money
        purse = Int(items[6])!
        
        // Add clues
        clues.append(items[7])
        clues.append(items[8])
        clues.append(items[9])
    }
}
