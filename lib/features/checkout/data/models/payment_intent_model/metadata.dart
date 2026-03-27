class Metadata {
  Metadata();

  // قم بتغيير الـ factory ليعود بكائن فارغ
  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata();
  }

  // قم بتغيير الـ toJson لتعود بـ Map فارغة
  Map<String, dynamic> toJson() {
    return {};
  }
}
