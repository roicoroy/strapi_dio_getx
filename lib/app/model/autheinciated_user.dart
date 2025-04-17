class AutheinciatedUser {
  AutheinciatedUser({
    required this.id,
    required this.username,
    required this.email,
    required this.provider,
    required this.confirmed,
    required this.blocked,
    required this.createdAt,
    required this.updatedAt,
    required this.documentId,
    required this.publishedAt,
    required this.role,
    required this.image,
  });

  final int? id;
  final String? username;
  final String? email;
  final String? provider;
  final bool? confirmed;
  final bool? blocked;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? documentId;
  final DateTime? publishedAt;
  final Role? role;
  final Image? image;

  AutheinciatedUser copyWith({
    int? id,
    String? username,
    String? email,
    String? provider,
    bool? confirmed,
    bool? blocked,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? documentId,
    DateTime? publishedAt,
    Role? role,
    Image? image,
  }) {
    return AutheinciatedUser(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      provider: provider ?? this.provider,
      confirmed: confirmed ?? this.confirmed,
      blocked: blocked ?? this.blocked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      documentId: documentId ?? this.documentId,
      publishedAt: publishedAt ?? this.publishedAt,
      role: role ?? this.role,
      image: image ?? this.image,
    );
  }

  factory AutheinciatedUser.fromJson(Map<String, dynamic> json) {
    return AutheinciatedUser(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      provider: json["provider"],
      confirmed: json["confirmed"],
      blocked: json["blocked"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      documentId: json["documentId"],
      publishedAt: DateTime.tryParse(json["publishedAt"] ?? ""),
      role: json["role"] == null ? null : Role.fromJson(json["role"]),
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "provider": provider,
    "confirmed": confirmed,
    "blocked": blocked,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "documentId": documentId,
    "publishedAt": publishedAt?.toIso8601String(),
    "role": role?.toJson(),
    "image": image?.toJson(),
  };

  @override
  String toString() {
    return "$id, $username, $email, $provider, $confirmed, $blocked, $createdAt, $updatedAt, $documentId, $publishedAt, $role, $image, ";
  }
}

class Image {
  Image({
    required this.id,
    required this.name,
    required this.alternativeText,
    required this.caption,
    required this.width,
    required this.height,
    required this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    required this.previewUrl,
    required this.provider,
    required this.providerMetadata,
    required this.createdAt,
    required this.updatedAt,
    required this.documentId,
    required this.publishedAt,
  });

  final int? id;
  final String? name;
  final dynamic alternativeText;
  final dynamic caption;
  final int? width;
  final int? height;
  final dynamic formats;
  final String? hash;
  final String? ext;
  final String? mime;
  final double? size;
  final String? url;
  final dynamic previewUrl;
  final String? provider;
  final ProviderMetadata? providerMetadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? documentId;
  final DateTime? publishedAt;

  Image copyWith({
    int? id,
    String? name,
    dynamic? alternativeText,
    dynamic? caption,
    int? width,
    int? height,
    dynamic? formats,
    String? hash,
    String? ext,
    String? mime,
    double? size,
    String? url,
    dynamic? previewUrl,
    String? provider,
    ProviderMetadata? providerMetadata,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? documentId,
    DateTime? publishedAt,
  }) {
    return Image(
      id: id ?? this.id,
      name: name ?? this.name,
      alternativeText: alternativeText ?? this.alternativeText,
      caption: caption ?? this.caption,
      width: width ?? this.width,
      height: height ?? this.height,
      formats: formats ?? this.formats,
      hash: hash ?? this.hash,
      ext: ext ?? this.ext,
      mime: mime ?? this.mime,
      size: size ?? this.size,
      url: url ?? this.url,
      previewUrl: previewUrl ?? this.previewUrl,
      provider: provider ?? this.provider,
      providerMetadata: providerMetadata ?? this.providerMetadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      documentId: documentId ?? this.documentId,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json["id"],
      name: json["name"],
      alternativeText: json["alternativeText"],
      caption: json["caption"],
      width: json["width"],
      height: json["height"],
      formats: json["formats"],
      hash: json["hash"],
      ext: json["ext"],
      mime: json["mime"],
      size: json["size"],
      url: json["url"],
      previewUrl: json["previewUrl"],
      provider: json["provider"],
      providerMetadata:
          json["provider_metadata"] == null
              ? null
              : ProviderMetadata.fromJson(json["provider_metadata"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      documentId: json["documentId"],
      publishedAt: DateTime.tryParse(json["publishedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "alternativeText": alternativeText,
    "caption": caption,
    "width": width,
    "height": height,
    "formats": formats,
    "hash": hash,
    "ext": ext,
    "mime": mime,
    "size": size,
    "url": url,
    "previewUrl": previewUrl,
    "provider": provider,
    "provider_metadata": providerMetadata?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "documentId": documentId,
    "publishedAt": publishedAt?.toIso8601String(),
  };

  @override
  String toString() {
    return "$id, $name, $alternativeText, $caption, $width, $height, $formats, $hash, $ext, $mime, $size, $url, $previewUrl, $provider, $providerMetadata, $createdAt, $updatedAt, $documentId, $publishedAt, ";
  }
}

class ProviderMetadata {
  ProviderMetadata({required this.publicId, required this.resourceType});

  final String? publicId;
  final String? resourceType;

  ProviderMetadata copyWith({String? publicId, String? resourceType}) {
    return ProviderMetadata(
      publicId: publicId ?? this.publicId,
      resourceType: resourceType ?? this.resourceType,
    );
  }

  factory ProviderMetadata.fromJson(Map<String, dynamic> json) {
    return ProviderMetadata(
      publicId: json["public_id"],
      resourceType: json["resource_type"],
    );
  }

  Map<String, dynamic> toJson() => {
    "public_id": publicId,
    "resource_type": resourceType,
  };

  @override
  String toString() {
    return "$publicId, $resourceType, ";
  }
}

class Role {
  Role({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.documentId,
    required this.publishedAt,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? documentId;
  final DateTime? publishedAt;

  Role copyWith({
    int? id,
    String? name,
    String? description,
    String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? documentId,
    DateTime? publishedAt,
  }) {
    return Role(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      documentId: documentId ?? this.documentId,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      type: json["type"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      documentId: json["documentId"],
      publishedAt: DateTime.tryParse(json["publishedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "type": type,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "documentId": documentId,
    "publishedAt": publishedAt?.toIso8601String(),
  };

  @override
  String toString() {
    return "$id, $name, $description, $type, $createdAt, $updatedAt, $documentId, $publishedAt, ";
  }
}
