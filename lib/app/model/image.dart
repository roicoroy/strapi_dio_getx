// To parse this JSON data, do
//
//     final image = imageFromJson(jsonString);

import 'dart:convert';

Image imageFromJson(String str) => Image.fromJson(json.decode(str));

String imageToJson(Image data) => json.encode(data.toJson());

class Image {
    ImageClass image;

    Image({
        required this.image,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        image: ImageClass.fromJson(json["image"]),
    );

    Map<String, dynamic> toJson() => {
        "image": image.toJson(),
    };
}

class ImageClass {
    int? id;
    String? name;
    String? alternativeText;
    String? caption;
    int? width;
    int? height;
    Formats? formats;
    String? hash;
    String? ext;
    String? mime;
    double? size;
    String? url;
    dynamic? previewUrl;
    String? provider;
    dynamic? providerMetadata;
    DateTime? createdAt;
    DateTime? updatedAt;

    ImageClass({
        this.id,
        this.name,
        this.alternativeText,
        this.caption,
        required this.width,
        this.height,
        this.formats,
        this.hash,
        this.ext,
        this.mime,
        this.size,
        this.url,
        this.previewUrl,
        this.provider,
        this.providerMetadata,
        this.createdAt,
        this.updatedAt,
    });

    factory ImageClass.fromJson(Map<String, dynamic> json) => ImageClass(
        id: json["id"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: Formats.fromJson(json["formats"]),
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"].toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats!.toJson(),
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
    };
}

class Formats {
    Large? large;
    Large? small;
    Large? medium;
    Large? thumbnail;

    Formats({
        this.large,
        this.small,
        this.medium,
        this.thumbnail,
    });

    factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        large: Large.fromJson(json["large"]),
        small: Large.fromJson(json["small"]),
        medium: Large.fromJson(json["medium"]),
        thumbnail: Large.fromJson(json["thumbnail"]),
    );

    Map<String, dynamic> toJson() => {
        "large": large!.toJson(),
        "small": small!.toJson(),
        "medium": medium!.toJson(),
        "thumbnail": thumbnail!.toJson(),
    };
}

class Large {
    String? ext;
    String? url;
    String? hash;
    String? mime;
    String? name;
    dynamic? path;
    double? size;
    int? width;
    int? height;

    Large({
        this.ext,
        this.url,
        this.hash,
        this.mime,
        this.name,
        this.path,
        this.size,
        this.width,
        this.height,
    });

    factory Large.fromJson(Map<String, dynamic> json) => Large(
        ext: json["ext"],
        url: json["url"],
        hash: json["hash"],
        mime: json["mime"],
        name: json["name"],
        path: json["path"],
        size: json["size"].toDouble(),
        width: json["width"],
        height: json["height"],
    );

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
    };
}
