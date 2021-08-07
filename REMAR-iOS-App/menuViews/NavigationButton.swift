//
//  NavigationButton.swift
//  REMAR-iOS-App
//
//  This view allows us to use a navigation link with an action. Currently being used in menuView for updating the QuestionManager's number.
//
//  Taken from: https://stackoverflow.com/a/58908409 - on 07/08/2020
//

import SwiftUI

struct NavigationButton<Destination: View, Label: View>: View {
    var action: () -> Void = { }
    var destination: () -> Destination
    var label: () -> Label

    @State private var isActive: Bool = false

    var body: some View {
        Button(action: {
            self.action()
            self.isActive.toggle()
        }) {
            self.label()
              .background(
                ScrollView { // Fixes a bug where the navigation bar may become hidden on the pushed view
                    NavigationLink(destination: LazyDestination { self.destination() },
                                                 isActive: self.$isActive) { EmptyView() }
                }
              )
        }
    }
}

// This view lets us avoid instantiating our Destination before it has been pushed.
struct LazyDestination<Destination: View>: View {
    var destination: () -> Destination
    var body: some View {
        self.destination()
    }
}
