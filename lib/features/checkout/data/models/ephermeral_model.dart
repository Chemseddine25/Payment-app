class EphemeralKeyModel {
  String? id;
  String? object;
  int? created;
  int? expires;
  bool? livemode;
  String? secret;

  EphemeralKeyModel({
    this.id,
    this.object,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
  });

  factory EphemeralKeyModel.fromJson(Map<String, dynamic> json) {
    return EphemeralKeyModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      created: json['created'] as int?,
      expires: json['expires'] as int?,
      livemode: json['livemode'] as bool?,
      secret: json['secret'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'object': object,
        'created': created,
        'expires': expires,
        'livemode': livemode,
        'secret': secret,
      };
}
