enum Categories {
  complete,
  flowers,
  transports,
  cremations,
  coffins,
  gravestones,
  publications,
  decorations,
  wreaths;

  String toJson() => name;
  static Categories fromJson(String json) => values.byName(json);
  static List<String> toList() => values.map((day) => day.name).toList();
}
