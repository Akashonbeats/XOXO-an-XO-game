//
//  GameView.swift
//  XOXO
//
//  Created by Akash Sampath on 12/04/24.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                  .ignoresSafeArea()
            VStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .toolbar(){
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("End Game"){
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                    
                }
            }
            
        }.inNavigationStack()
    }
}

#Preview {
    GameView()
}
