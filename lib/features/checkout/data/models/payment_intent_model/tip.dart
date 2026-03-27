class Tip {
  Tip();

  // تعديل الـ factory ليعود بكائن فارغ بدلاً من throw
  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip();
  }

  // تعديل الـ toJson ليعود بـ Map فارغة
  Map<String, dynamic> toJson() {
    return {};
  }
}
