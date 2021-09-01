extension FormattedDuration on Duration {
  String get formatted {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String hours = twoDigits(this.inHours.remainder(24));
    String minutes = twoDigits(this.inMinutes.remainder(60));
    String seconds = twoDigits(this.inSeconds.remainder(60));

    return "$hours:$minutes:$seconds";
  }
}