//
//  ContentView.swift
//  AppTest
//
//  Created by Ateş İsfendiyaroğlu on 11.08.2022.
//

import SwiftUI

struct ContentView : View
{
    // Item we're currently looking at
    @State var currentOption = 0
    
    let options : [Option] = [
        .init(title: "Home", imgName: "house"),
        .init(title: "About", imgName: "info.circle"),
        .init(title: "Settings", imgName: "gear"),
        .init(title: "Social", imgName: "message")
    ]
    
    var body : some View
    {
        NavigationView
        {
            ListView(options: options, currentSelection: $currentOption) // Left View
            
            // Right View
            if currentOption == 1
            { Text("About View") }
            else if currentOption == 2
            { Text("Settings View") }
            else if currentOption == 3
            { Text("Social View") }
            else { MainView() } // currentOption == 0
            
            
        }.frame(minWidth: 600, minHeight: 400)
    }
}

struct MainView : View
{
    let cols : [GridItem] = [
        .init(.flexible()),
        .init(.flexible())
    ]
    
    let images = Array(1...2).map{ "IMG\($0)" }
    
    var body : some View
    {
        VStack
        {
            Image("ChromeBG")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            LazyVGrid(columns: cols)
            {
                ForEach(images, id: \.self)
                { img in
                    VStack
                    {
                        Image(img)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("ATS")
                    }
                }
            }
            
            // Fill up available space in the axis of expansion
            Spacer()
        }
    }
}

struct ListView : View
{
    let options : [Option]
    @Binding var currentSelection : Int
    
    var body : some View
    {
        VStack
        {
            let current = options[currentSelection]
            ForEach(options, id : \.self)
            { option in
                HStack
                {
                    Image(systemName: option.imgName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                    Text(option.title)
                        .foregroundColor(current == option ?
                                         Color.blue : Color.black)
                    Spacer()
                }
                .padding(8)
                .onTapGesture
                {
                    if option.title == "Home"
                    { currentSelection = 0 }
                    else if option.title == "About"
                    { currentSelection = 1 }
                    else if option.title == "Settings"
                    { currentSelection = 2}
                    else if option.title == "Social"
                    { currentSelection = 3 }
                }
            }
        }
        Spacer()
    }
}

struct Option : Hashable
{
    let title : String
    let imgName : String
}

struct ContentView_Previews : PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}

