class Formater {
  String formatAuthorsAsCommaSeparatedText(List<String> authors) {
    if (authors.isEmpty) {
      return 'Unknown';
    }
    return authors.join(", ");
  }
}
