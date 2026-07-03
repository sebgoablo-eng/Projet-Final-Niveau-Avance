class DateFormatter {
  static String format(DateTime? date) {
    if (date == null) {
      return "Non renseignée";
    }

    return "${date.day}/${date.month}/${date.year}";
  }
}
