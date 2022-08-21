class GameController {
  static bool isPlaying = false;
  static bool isGameOver = false;
  static int nextPage = 0;
  static int beeCount = 100;
  static bool hasWon = false;

  static void resetGame() {
    isPlaying = false;

    nextPage = 0;
    beeCount = 100;
  }
}
