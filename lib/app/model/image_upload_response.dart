class ImageUploadResponse {
  ImageUploadResponse({
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

  final dynamic? id;
  final String? name;
  final dynamic alternativeText;
  final dynamic caption;
  final int? width;
  final int? height;
  final Formats? formats;
  final String? hash;
  final String? ext;
  final String? mime;
  final dynamic? size;
  final String? url;
  final dynamic previewUrl;
  final String? provider;
  final ProviderMetadata? providerMetadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? documentId;
  final DateTime? publishedAt;

  ImageUploadResponse copyWith({
    dynamic? id,
    String? name,
    dynamic? alternativeText,
    dynamic? caption,
    int? width,
    int? height,
    Formats? formats,
    String? hash,
    String? ext,
    String? mime,
    dynamic? size,
    String? url,
    dynamic? previewUrl,
    String? provider,
    ProviderMetadata? providerMetadata,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? documentId,
    DateTime? publishedAt,
  }) {
    return ImageUploadResponse(
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

  factory ImageUploadResponse.fromJson(Map<String, dynamic> json) {
    return ImageUploadResponse(
      id: json["id"],
      name: json["name"],
      alternativeText: json["alternativeText"],
      caption: json["caption"],
      width: json["width"],
      height: json["height"],
      formats:
          json["formats"] == null ? null : Formats.fromJson(json["formats"]),
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
    "formats": formats?.toJson(),
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

class Formats {
  Formats({
    required this.large,
    required this.small,
    required this.medium,
    required this.thumbnail,
  });

  final Large? large;
  final Large? small;
  final Large? medium;
  final Large? thumbnail;

  Formats copyWith({
    Large? large,
    Large? small,
    Large? medium,
    Large? thumbnail,
  }) {
    return Formats(
      large: large ?? this.large,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  factory Formats.fromJson(Map<String, dynamic> json) {
    return Formats(
      large: json["large"] == null ? null : Large.fromJson(json["large"]),
      small: json["small"] == null ? null : Large.fromJson(json["small"]),
      medium: json["medium"] == null ? null : Large.fromJson(json["medium"]),
      thumbnail:
          json["thumbnail"] == null ? null : Large.fromJson(json["thumbnail"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "large": large?.toJson(),
    "small": small?.toJson(),
    "medium": medium?.toJson(),
    "thumbnail": thumbnail?.toJson(),
  };

  @override
  String toString() {
    return "$large, $small, $medium, $thumbnail, ";
  }
}

class Large {
  Large({
    required this.ext,
    required this.url,
    required this.hash,
    required this.mime,
    required this.name,
    required this.path,
    required this.size,
    required this.width,
    required this.height,
    required this.sizeInBytes,
    required this.providerMetadata,
  });

  final String? ext;
  final String? url;
  final String? hash;
  final String? mime;
  final String? name;
  final dynamic path;
  final double? size;
  final int? width;
  final int? height;
  final int? sizeInBytes;
  final ProviderMetadata? providerMetadata;

  Large copyWith({
    String? ext,
    String? url,
    String? hash,
    String? mime,
    String? name,
    dynamic? path,
    double? size,
    int? width,
    int? height,
    int? sizeInBytes,
    ProviderMetadata? providerMetadata,
  }) {
    return Large(
      ext: ext ?? this.ext,
      url: url ?? this.url,
      hash: hash ?? this.hash,
      mime: mime ?? this.mime,
      name: name ?? this.name,
      path: path ?? this.path,
      size: size ?? this.size,
      width: width ?? this.width,
      height: height ?? this.height,
      sizeInBytes: sizeInBytes ?? this.sizeInBytes,
      providerMetadata: providerMetadata ?? this.providerMetadata,
    );
  }

  factory Large.fromJson(Map<String, dynamic> json) {
    return Large(
      ext: json["ext"],
      url: json["url"],
      hash: json["hash"],
      mime: json["mime"],
      name: json["name"],
      path: json["path"],
      size: json["size"],
      width: json["width"],
      height: json["height"],
      sizeInBytes: json["sizeInBytes"],
      providerMetadata:
          json["provider_metadata"] == null
              ? null
              : ProviderMetadata.fromJson(json["provider_metadata"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "ext": ext,
    "url": url,
    "hash": hash,
    "mime": mime,
    "name": name,
    "path": path,
    "size": size,
    "width": width,
    "height": height,
    "sizeInBytes": sizeInBytes,
    "provider_metadata": providerMetadata?.toJson(),
  };

  @override
  String toString() {
    return "$ext, $url, $hash, $mime, $name, $path, $size, $width, $height, $sizeInBytes, $providerMetadata, ";
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
