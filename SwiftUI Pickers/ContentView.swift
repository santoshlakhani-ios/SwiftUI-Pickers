//
//  ContentView.swift
//  SwiftUI Pickers
//
//  Created by Santosh Lakhani on 06/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var image: String? = "square.fill"
    @State private var selectedColorString: String? = "red"
    @State private var selectedColorOld: Color = .red
    @State private var selectedColorNew: Color = .red
    @State private var selectedColor: Color = .black
    
    @State private var calendarId: Int = 0
    @State private var date: Date = Date()
    
    @State private var selectedFruit = "Apple"
    let fruits = ["Apple", "Banana", "Orange", "Grape"]
    
    var body: some View {
        VStack {
            Spacer()
            selectColorByName()
            Spacer()
            selectColorByPalate()
            Spacer()
            selectDate()
            Spacer()
            selectFruit()
            Spacer()
        }
        .padding()
    }
    
    fileprivate func selectColorByName() -> some View {
        return HStack {
            Image(systemName: "square.fill").foregroundColor(selectedColorOld)
            Image(systemName: "square.fill").foregroundColor(selectedColorNew)
            Spacer()
            Text("Select Color from Picker")
            Picker("Select Color", selection: $selectedColorString) {
                Text("Red").tag("red")
                Text("Green").tag("green")
                Text("Blue").tag("blue")
            }.onChange(of: selectedColorString, { oldValue, newValue in
                switch oldValue {
                case "red":
                    selectedColorOld = .red
                case "green":
                    selectedColorOld = .green
                case "blue":
                    selectedColorOld = .blue
                default:
                    break
                }
                
                switch newValue {
                case "red":
                    selectedColorNew = .red
                case "green":
                    selectedColorNew = .green
                case "blue":
                    selectedColorNew = .blue
                default:
                    break
                }
            })
        }
    }
    
    fileprivate func selectColorByPalate() -> HStack<some View> {
        return HStack {
            Image(systemName: "square.fill").foregroundColor(selectedColor)
            Text("Select Color Palate")
            ColorPicker("", selection: $selectedColor)
        }
    }
    
    fileprivate func selectDate() -> some View {
        return DatePicker(
            "Date", selection: $date, in: ...Date(), displayedComponents: [.date]
        )
        .id(calendarId)
        .onChange(of: date) { _ in
            calendarId += 1
        }
    }
        
    fileprivate func selectFruit() -> some View {
        return VStack {
            Text("Choose a fruit")
            Picker("Choose a fruit", selection: $selectedFruit) {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

#Preview {
    ContentView()
}
