//
//  ContentView.swift
//  XOXO
//
//  Created by Akash Sampath on 11/04/24.
//

import SwiftUI

struct StartView: View {
  @State private var gameType: GameType = .undetermined
  @State private var yourName = ""
  @State private var opponentName = ""
  @FocusState private var focus: Bool
@State private var startGame = false

  var body: some View {
    ZStack {
      Color("BackgroundColor")
            .ignoresSafeArea()
      VStack {
        Image("XOXOlarge")
          .resizable()
          .aspectRatio(contentMode: .fit)
        Picker("Select Game", selection: $gameType) {
          Text("Select Game type").tag(GameType.undetermined)
          Text("Two sharing device").tag(GameType.single)
          Text("Challenge your device").tag(GameType.bot)
          Text("Challenge a friend").tag(GameType.peer)
        }
        .padding()
        .background(Rectangle()
          .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.653))
          .opacity(0.5)
          .foregroundColor(.white)
          .blur(radius: 20)
          .cornerRadius(25))
        Text(gameType.description)
          .padding()
        VStack {
          switch gameType {
          case .single:
            VStack {
              TextField("Your Name", text: $yourName)
              TextField("Opponent Name", text: $opponentName)
            }
          case .bot:
            TextField("Your Name", text: $yourName)
          case .peer:
            EmptyView()
          case .undetermined:
            EmptyView()
          }
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .focused($focus)
        .frame(width: 350)
        if gameType != .peer {
          Button("Start Game") {
            focus = false
              startGame.toggle()
          }
          .padding()
          .background(Rectangle()
            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.653))
            .opacity(0.5)
            .foregroundColor(.white)
            .blur(radius: 20)
            .cornerRadius(15))
          .padding()
          .disabled(
            gameType == .undetermined ||
              gameType == .bot && yourName.isEmpty ||
              gameType == .single && opponentName.isEmpty
          )
        }
      }
      .padding()
    }
    .fullScreenCover(isPresented: $startGame) {
        GameView()
    }
    .inNavigationStack()
  }
}

#Preview {
  StartView()
}
