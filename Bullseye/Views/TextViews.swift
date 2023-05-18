//
//  TextView.swift
//  Bullseye
//
//  Created by Iwy2th on 04/04/2023.
//

import SwiftUI

struct InstructionText: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.footnote)
      .multilineTextAlignment(.center)
      .bold()
      .lineSpacing(4.0)
      .kerning(2.0)

      .foregroundColor(Color("TextColor"))
  }
}
struct BigNumberText: View {
  var text: String
  var body: some View {
    Text(text)
      .kerning(-1.0)
      .font(.largeTitle)
      .fontWeight(.black)
      .foregroundColor(Color("TextColor"))
  }
}
struct SliderLabelText: View {
  var text: String
  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color("TextColor"))
  }
}
struct LabelText: View {
  var text: String
  var body: some View {
    Text(text.uppercased())
      .kerning(1.5)
      .font(.caption)
      .bold()
      .foregroundColor(Color("TextColor"))

  }
}
struct BodyText: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.subheadline)
      .fontWeight(.semibold)
      .multilineTextAlignment(.center)
      .lineSpacing(12)
  }
}
struct ScoreText: View {
  var score: Int
  var body: some View {
    Text(String(score))
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
  }
}
struct DateText: View {
  var date: Date
  var body: some View {
    Text(date , style: .time )
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
  }
}
struct ButtonText: View {
  var text: String
  var body: some View {
    Text(text.uppercased())
      .bold()
      .foregroundColor(Color(.white))
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        Color.accentColor
      )
      .cornerRadius(12.0)
  }
}
struct BigBoldText: View {
  let text: String
  var body: some View {
    Text(text.uppercased())
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
      .font(.title)
      .fontWeight(.black)
  }
}


struct TextView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "Ins")
      BigNumberText(text: "999")
      SliderLabelText(text: "1")
      LabelText(text: "Score")
      BodyText(text: "You scored 200 Points\n 🎉🎉🎉🎉 ")
      ButtonText(text: "Start New Round")
      ScoreText(score: 457)
      DateText(date: Date())
      BigBoldText(text: "LeaderBo")
    }
    .padding()
  }
}
