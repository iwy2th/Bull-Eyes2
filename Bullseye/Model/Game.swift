
import Foundation

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  var leaderboardEntries: [leaderboardEntry] = []
  mutating func points(sliderValue: Int) -> Int {
    let difference = abs(target - sliderValue)
    let bonus: Int
    if difference == 0 {
      bonus = 100
    } else if difference <= 2 {
      bonus = 50
    } else {
      bonus = 0
    }
    return 100 - difference + bonus
  }
  mutating func startNewRound(points: Int) {
    addToLeaderboardEntry(Score: points)
    score += points
    round += 1
    target = Int.random(in: 1...100)
  }

  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 1...100)
  }
  mutating func addToLeaderboardEntry(Score: Int) {
    leaderboardEntries.append(leaderboardEntry(score: score, date: Date()))
    leaderboardEntries.sort { entry1, entry2 in
      entry1.score > entry2.score
    }
  }

}
struct leaderboardEntry {
  let score: Int
  let date: Date
}
