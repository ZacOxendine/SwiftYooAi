//
//  Binding-OnChange.swift
//  SwiftYooAi
//
//  Created by Zachary Oxendine on 11/3/20.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}
