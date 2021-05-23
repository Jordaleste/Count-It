//
//  ContentView.swift
//  Counter WatchKit Extension
//
//  Created by Charles Eison on 5/22/21.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.system(size: 130, weight: .bold))
                .foregroundColor(.blue)
            Spacer()
            HStack {
                
                Button(action: {
                    count -= 1
                }, label: {
                    Image(systemName: "minus")
                })
                .buttonStyle(BorderedButtonStyle(tint: Color.red.opacity(255)))
                .foregroundColor(.white).font(.title2)
                .padding()
                
                Button(action: {
                    count += 1
                }, label: {
                    Image(systemName: "plus")
                })
                .buttonStyle(BorderedButtonStyle(tint: Color.green.opacity(255)))
                .foregroundColor(.white).font(.title2)
                .padding()
            }
        }
        .onLongPressGesture(minimumDuration: 1) {
            showingAlert.toggle()
        }
        .alert(isPresented: $showingAlert, content: {
            Alert(
                title: Text("Reset"),
                message: Text("Reset Counter?"),
                primaryButton: .default(Text("OK"), action: {
                count = 0
            }),
                secondaryButton: .cancel(Text("Not Yet")))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
