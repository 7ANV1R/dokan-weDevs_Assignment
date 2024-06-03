class SortFilterPreset {
  final String title;
  final int value;

  SortFilterPreset({required this.title, required this.value});

  static List<SortFilterPreset> getSortData() {
    return [
      SortFilterPreset(title: "Newest", value: 0),
      SortFilterPreset(title: "Oldest", value: 1),
      SortFilterPreset(title: "Price Low > High", value: 2),
      SortFilterPreset(title: "Price High > Low", value: 3),
    ];
  }

  @override
  bool operator ==(covariant SortFilterPreset other) {
    if (identical(this, other)) return true;

    return other.title == title && other.value == value;
  }

  @override
  int get hashCode => title.hashCode ^ value.hashCode;
}

String sortText(int id) {
  switch (id) {
    case 0:
      return 'Newest';
    case 1:
      return 'Oldest';
    case 2:
      return 'Price (Low > High)';
    case 3:
      return 'Price (High > Low)';

    default:
      return 'Newest';
  }
}
