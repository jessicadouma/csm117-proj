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
    
    var currentRound = 0
    var roundTime = 0
    
    var roundActive = false
    
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
    
    open func read() -> [String?] {
        var response = [String?]()
        
        if let byteResponse = client.read(1024 * 10) {
            if let resp = String(bytes: byteResponse, encoding: .utf8) {
                response = decodeResponse(response: resp)
            }
        }
        
        return response
    }
    
    private func prepareMessage(message: String) -> [Byte] {
        var buffer: [Byte] = Array(message.utf8)
        
        // Add virtual newline \r\n
        buffer.append(13)
        buffer.append(10)
        
        return buffer
    }
    
    private func decodeResponse(response: String) -> [String?] {
        let buffer = response.components(separatedBy: "\r\n")
        
        var allDataReceived = [String?]()
        
        for possibleEvent in buffer {
            if possibleEvent != "" {
                let responseArr = possibleEvent.components(separatedBy: ":")
                let event = responseArr[0]
                let data = responseArr[1]
            
                if event  == "ITEMS" {
                    addInventory(items: data.components(separatedBy: ";"))
                } else if event == "TRANSACTION" {
                    processTransaction(data.components(separatedBy: ";"))
                } else if event == "ROUNDSTART" {
                    roundActive = true
                    var roundInfo = data.components(separatedBy: ";")
                    
                    currentRound = Int(roundInfo[0])!
                    roundTime = Int(roundInfo[1])!
                }
            
                allDataReceived.append(data)
            }
        }
        
        return allDataReceived
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
    
    open func chipTransaction(amount: Int, from chip: String) {
        if let value = chips[chip] {
            chips[chip] = value + amount
        }
    }
    
    open func gemTransaction(amount: Int, from gem: String) {
        if let value = gems[gem] {
            gems[gem] = value + amount
        }
    }
    
    open func moneyTransaction(amount: Int) {
        let newAmount = purse + amount
        
        if newAmount >= 0 {
            purse = newAmount
        }
    }
    
    private func processTransaction(_ transaction: [String]) {
        chipTransaction(amount: Int(transaction[1])!, from: "Red")
        chipTransaction(amount: Int(transaction[2])!, from: "White")
        chipTransaction(amount: Int(transaction[3])!, from: "Blue")
        
        gemTransaction(amount: Int(transaction[4])!, from: "Onyx")
        gemTransaction(amount: Int(transaction[5])!, from: "Emeralds")
        gemTransaction(amount: Int(transaction[6])!, from: "Pearls")
        
        moneyTransaction(amount: Int(transaction[7])!)
        
        if transaction[8] != "0" {
            clues.append(transaction[8])
        }
        
        if transaction[9] != "0" {
            clues.append(transaction[9])
        }
        
        if transaction[10] != "0" {
            clues.append(transaction[10])
        }
    }
}
