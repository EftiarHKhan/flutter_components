String getTimeDifference(String date) {
    DateTime dateTime = DateTime.parse(date);
    final Duration timeLeft = DateTime.now().difference(dateTime);
    String timeDifference = '';

    if (timeLeft.inDays > 0) {
      timeDifference += '${timeLeft.inDays} days ';
    } else if (timeLeft.inHours > 0) {
      timeDifference += '${timeLeft.inHours} hours ';
    } else if (timeLeft.inMinutes.remainder(60) > 0) {
      timeDifference += '${timeLeft.inMinutes.remainder(60)} minutes ';
    } else if (timeLeft.inSeconds.remainder(60) > 0) {
      timeDifference += '${timeLeft.inSeconds.remainder(60)} seconds ';
    }
    timeDifference += 'ago';

    return timeDifference;
  }
