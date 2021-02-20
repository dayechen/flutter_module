class NumUtil {
  static double percent(double num, double total) {
    return (num / total) * 100;
  }

  // 大于0并小于1
  static bool isLessThan1(double num) {
    return num >= 0.0 && num <= 1.0;
  }
}
