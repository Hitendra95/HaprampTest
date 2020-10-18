//
//  UpdateViewProtocol.swift
//  HaprampTest
//
//  Created by Hitendra Dubey on 18/10/20.
//
import Foundation

//MARK: Update view Protocl to listen respone and update views
protocol UpdateViewProtocol : NSObjectProtocol {
    func updateView(event: Int, eventtype: Int)
}
