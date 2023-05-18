//
//  ContentView.swift
//  Bullseye
//
//  Created by Iwy2th on 03/04/2023.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var sliderValue: Double = 50.0
  @State private var game: Game = Game()
  var body: some View {
    ZStack {
      BackgroundView(game: $game)
      VStack {
        InstructionView(game: $game)
          .padding(.bottom, alertIsVisible ? 0 : 100)
        if alertIsVisible {
          PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        } else {
          HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        }
      }
      if !alertIsVisible {
        SliderView(sliderValue: $sliderValue)
          .zIndex(2)
          .transition(.scale)
      }
    }
  }
}
struct InstructionView: View {
  @Binding var game : Game
  var body: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .padding(.horizontal, 30)
      BigNumberText(text: String(game.target))
    }
  }
}
struct SliderView: View {
  @Binding var sliderValue: Double
  var body: some View {
    HStack {
      SliderLabelText(text: "1")
        .frame(width: 35)
      Slider(value: $sliderValue, in: 1.0...100.0)
      SliderLabelText(text: "100")
        .frame(width: 35)
    }
  }
}
struct HitMeButton: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  var body: some View {
    Button("Hit me".uppercased()) {
      withAnimation{
        alertIsVisible = true
      }
    }
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtonColor")
        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
      }
    )
    .overlay(
      RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
        .strokeBorder(Color.white, lineWidth: Constants.General.strokeWith)

    )
    .foregroundColor(.white)
    .cornerRadius(Constants.General.roundRectCornerRadius)
    .bold()
    .font(.title3)

  }
}
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .preferredColorScheme(.dark)
      .previewDevice("iPhone 14 Pro Max")
  }
}
