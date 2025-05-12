class Source {
  String? id; // Nullable to handle null source.id
  String name;

  // Constructor
  Source({this.id, required this.name});

  // Factory function to map JSON
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] as String?, // Allow null
      name: json['name'] as String? ?? 'Unknown', // Fallback for null
    );
  }
}