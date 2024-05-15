import 'dart:math';

class JoinsCalculator {
  // Function to calculate distance between two points using Euclidean distance formula
  static double calculateDistance(double x1, double y1, double x2, double y2) {
    // Calculate distance between two points
    return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
  }

  static String calculateDirection(double x1, double y1, double x2, double y2) {
    // Calculate direction between two points using trigonometry
    double angle =
        atan2(y2 - y1, x2 - x1) * (180 / pi); // Convert radians to degrees

    // Ensure angle is positive
    if (angle < 0) {
      angle += 360;
    }

    // Convert angle to the format "78.03.56"
    int degrees = angle.toInt();
    int minutes = ((angle - degrees) * 60).toInt();
    int seconds = ((((angle - degrees) * 60) - minutes) * 60).toInt();

    return '$degrees.$minutes.$seconds';
  }
}
