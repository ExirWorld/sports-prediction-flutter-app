extension TimerExtension on int {
  String toPresenterCountdownTimer() {
    final minutes = ((this / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds = (this % 60).floor().toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
