//
//  RoundedView.swift
//  Bullseye
//
//  Created by Iwy2th on 04/04/2023.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
      )

  }
}
struct RoundedImageViewFilled: View {
  var systemName: String
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: Constants.General.roundedViewWidth, height: Constants.General.roundedViewHeight)
      .background(
        Circle()
          .fill(Color("ButtonFilledbackgroundColor"))
      )

  }
}
struct RoundRectTextView: View {
  var text: String
  var body: some View {
    Text(text)
      .kerning(-0.2)
      .bold()
      .font(.title3)
      .frame(width: 68, height: 56)
      .foregroundColor(Color("TextColor"))
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
          .stroke(lineWidth: Constants.General.strokeWith)
          .foregroundColor(Color("ButtonStrokeColor"))
      )

  }
}
struct RoundTextView: View {
  var text: String
  var body: some View {
    Text(text)
      .bold()
      .font(.title3)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
      )


  }
}
struct PreviewView: View {
  var body: some View {
    HStack(spacing: 10){
      RoundedImageViewFilled(systemName: "arrow.counterclockwise")
      RoundedImageViewStroked(systemName: "list.dash")
      RoundRectTextView(text: "100")
      RoundTextView(text: "1")
    }
  }
  struct RoundedView_Previews: PreviewProvider {
    static var previews: some View {
      PreviewView()
      PreviewView()
        .preferredColorScheme(.dark)
    }
  }
}
