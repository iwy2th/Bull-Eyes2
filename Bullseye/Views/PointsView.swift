//
//  PointsView.swift
//  Bullseye
//
//  Created by Iwy2th on 04/04/2023.
//

import SwiftUI

struct PointsView: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedValue)
    VStack(spacing: 10) {
      InstructionText(text: "The slider's value is")
      BigNumberText(text: String(roundedValue))
      BodyText(text: "You scored \(points) Points\n 🎉🎉🎉 ")
      Button {
        withAnimation{
          alertIsVisible = false
        }
        game.startNewRound(points: points)
      } label: {
        ButtonText(text: "Start New Round")
      }

    }
      .padding()
      .frame(maxWidth: 300)
      .background(
        Color("BackgroundColor")
      )
      .cornerRadius(21)
      .shadow(radius: 10, x: 10, y: 5)

  }
}

struct PointsView_Previews: PreviewProvider {
  static private var alertIsVisible = Binding.constant(false)
  static private var sliderValue = Binding.constant(50.0)
  static private var game = Binding.constant(Game())
  static var previews: some View {
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
      .previewInterfaceOrientation(.landscapeLeft)
      .preferredColorScheme(.dark)
  }
}
