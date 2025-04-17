class CowLogger {
    CowLogger({
        required this.data,
        required this.meta,
    });

    final List<CowLoggerDatum> data;
    final Meta? meta;

    CowLogger copyWith({
        List<CowLoggerDatum>? data,
        Meta? meta,
    }) {
        return CowLogger(
            data: data ?? this.data,
            meta: meta ?? this.meta,
        );
    }

    factory CowLogger.fromJson(Map<String, dynamic> json){ 
        return CowLogger(
            data: json["data"] == null ? [] : List<CowLoggerDatum>.from(json["data"]!.map((x) => CowLoggerDatum.fromJson(x))),
            meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "data": data.map((x) => x?.toJson()).toList(),
        "meta": meta?.toJson(),
    };

    @override
    String toString(){
        return "$data, $meta, ";
    }
}

class CowLoggerDatum {
    CowLoggerDatum({
        required this.id,
        required this.attributes,
    });

    final int? id;
    final PurpleAttributes? attributes;

    CowLoggerDatum copyWith({
        int? id,
        PurpleAttributes? attributes,
    }) {
        return CowLoggerDatum(
            id: id ?? this.id,
            attributes: attributes ?? this.attributes,
        );
    }

    factory CowLoggerDatum.fromJson(Map<String, dynamic> json){ 
        return CowLoggerDatum(
            id: json["id"],
            attributes: json["attributes"] == null ? null : PurpleAttributes.fromJson(json["attributes"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
    };

    @override
    String toString(){
        return "$id, $attributes, ";
    }
}

class PurpleAttributes {
    PurpleAttributes({
        required this.name,
        required this.description,
        required this.date,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        required this.usersPermissionsUser,
        required this.images,
    });

    final String? name;
    final String? description;
    final DateTime? date;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final DateTime? publishedAt;
    final UsersPermissionsUser? usersPermissionsUser;
    final Images? images;

    PurpleAttributes copyWith({
        String? name,
        String? description,
        DateTime? date,
        DateTime? createdAt,
        DateTime? updatedAt,
        DateTime? publishedAt,
        UsersPermissionsUser? usersPermissionsUser,
        Images? images,
    }) {
        return PurpleAttributes(
            name: name ?? this.name,
            description: description ?? this.description,
            date: date ?? this.date,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            publishedAt: publishedAt ?? this.publishedAt,
            usersPermissionsUser: usersPermissionsUser ?? this.usersPermissionsUser,
            images: images ?? this.images,
        );
    }

    factory PurpleAttributes.fromJson(Map<String, dynamic> json){ 
        return PurpleAttributes(
            name: json["name"],
            description: json["description"],
            date: DateTime.tryParse(json["date"] ?? ""),
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            publishedAt: DateTime.tryParse(json["publishedAt"] ?? ""),
            usersPermissionsUser: json["users_permissions_user"] == null ? null : UsersPermissionsUser.fromJson(json["users_permissions_user"]),
            images: json["images"] == null ? null : Images.fromJson(json["images"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "date": date?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "users_permissions_user": usersPermissionsUser?.toJson(),
        "images": images?.toJson(),
    };

    @override
    String toString(){
        return "$name, $description, $date, $createdAt, $updatedAt, $publishedAt, $usersPermissionsUser, $images, ";
    }
}

class Images {
    Images({
        required this.data,
    });

    final List<ImagesDatum> data;

    Images copyWith({
        List<ImagesDatum>? data,
    }) {
        return Images(
            data: data ?? this.data,
        );
    }

    factory Images.fromJson(Map<String, dynamic> json){ 
        return Images(
            data: json["data"] == null ? [] : List<ImagesDatum>.from(json["data"]!.map((x) => ImagesDatum.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "data": data.map((x) => x?.toJson()).toList(),
    };

    @override
    String toString(){
        return "$data, ";
    }
}

class ImagesDatum {
    ImagesDatum({
        required this.id,
        required this.attributes,
    });

    final int? id;
    final FluffyAttributes? attributes;

    ImagesDatum copyWith({
        int? id,
        FluffyAttributes? attributes,
    }) {
        return ImagesDatum(
            id: id ?? this.id,
            attributes: attributes ?? this.attributes,
        );
    }

    factory ImagesDatum.fromJson(Map<String, dynamic> json){ 
        return ImagesDatum(
            id: json["id"],
            attributes: json["attributes"] == null ? null : FluffyAttributes.fromJson(json["attributes"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
    };

    @override
    String toString(){
        return "$id, $attributes, ";
    }
}

class FluffyAttributes {
    FluffyAttributes({
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
    });

    final String? name;
    final String? alternativeText;
    final String? caption;
    final int? width;
    final int? height;
    final Formats? formats;
    final String? hash;
    final String? ext;
    final String? mime;
    final double? size;
    final String? url;
    final dynamic previewUrl;
    final String? provider;
    final dynamic providerMetadata;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    FluffyAttributes copyWith({
        String? name,
        String? alternativeText,
        String? caption,
        int? width,
        int? height,
        Formats? formats,
        String? hash,
        String? ext,
        String? mime,
        double? size,
        String? url,
        dynamic? previewUrl,
        String? provider,
        dynamic? providerMetadata,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) {
        return FluffyAttributes(
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
        );
    }

    factory FluffyAttributes.fromJson(Map<String, dynamic> json){ 
        return FluffyAttributes(
            name: json["name"],
            alternativeText: json["alternativeText"],
            caption: json["caption"],
            width: json["width"],
            height: json["height"],
            formats: json["formats"] == null ? null : Formats.fromJson(json["formats"]),
            hash: json["hash"],
            ext: json["ext"],
            mime: json["mime"],
            size: json["size"],
            url: json["url"],
            previewUrl: json["previewUrl"],
            provider: json["provider"],
            providerMetadata: json["provider_metadata"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
        );
    }

    Map<String, dynamic> toJson() => {
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
        "provider_metadata": providerMetadata,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };

    @override
    String toString(){
        return "$name, $alternativeText, $caption, $width, $height, $formats, $hash, $ext, $mime, $size, $url, $previewUrl, $provider, $providerMetadata, $createdAt, $updatedAt, ";
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

    factory Formats.fromJson(Map<String, dynamic> json){ 
        return Formats(
            large: json["large"] == null ? null : Large.fromJson(json["large"]),
            small: json["small"] == null ? null : Large.fromJson(json["small"]),
            medium: json["medium"] == null ? null : Large.fromJson(json["medium"]),
            thumbnail: json["thumbnail"] == null ? null : Large.fromJson(json["thumbnail"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "large": large?.toJson(),
        "small": small?.toJson(),
        "medium": medium?.toJson(),
        "thumbnail": thumbnail?.toJson(),
    };

    @override
    String toString(){
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
        );
    }

    factory Large.fromJson(Map<String, dynamic> json){ 
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
    };

    @override
    String toString(){
        return "$ext, $url, $hash, $mime, $name, $path, $size, $width, $height, ";
    }
}

class UsersPermissionsUser {
    UsersPermissionsUser({
        required this.data,
    });

    final Data? data;

    UsersPermissionsUser copyWith({
        Data? data,
    }) {
        return UsersPermissionsUser(
            data: data ?? this.data,
        );
    }

    factory UsersPermissionsUser.fromJson(Map<String, dynamic> json){ 
        return UsersPermissionsUser(
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };

    @override
    String toString(){
        return "$data, ";
    }
}

class Data {
    Data({
        required this.id,
        required this.attributes,
    });

    final int? id;
    final DataAttributes? attributes;

    Data copyWith({
        int? id,
        DataAttributes? attributes,
    }) {
        return Data(
            id: id ?? this.id,
            attributes: attributes ?? this.attributes,
        );
    }

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            id: json["id"],
            attributes: json["attributes"] == null ? null : DataAttributes.fromJson(json["attributes"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
    };

    @override
    String toString(){
        return "$id, $attributes, ";
    }
}

class DataAttributes {
    DataAttributes({
        required this.username,
        required this.email,
        required this.provider,
        required this.confirmed,
        required this.blocked,
        required this.createdAt,
        required this.updatedAt,
    });

    final String? username;
    final String? email;
    final String? provider;
    final bool? confirmed;
    final bool? blocked;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    DataAttributes copyWith({
        String? username,
        String? email,
        String? provider,
        bool? confirmed,
        bool? blocked,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) {
        return DataAttributes(
            username: username ?? this.username,
            email: email ?? this.email,
            provider: provider ?? this.provider,
            confirmed: confirmed ?? this.confirmed,
            blocked: blocked ?? this.blocked,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );
    }

    factory DataAttributes.fromJson(Map<String, dynamic> json){ 
        return DataAttributes(
            username: json["username"],
            email: json["email"],
            provider: json["provider"],
            confirmed: json["confirmed"],
            blocked: json["blocked"],
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
        );
    }

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "blocked": blocked,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };

    @override
    String toString(){
        return "$username, $email, $provider, $confirmed, $blocked, $createdAt, $updatedAt, ";
    }
}

class Meta {
    Meta({
        required this.pagination,
    });

    final Pagination? pagination;

    Meta copyWith({
        Pagination? pagination,
    }) {
        return Meta(
            pagination: pagination ?? this.pagination,
        );
    }

    factory Meta.fromJson(Map<String, dynamic> json){ 
        return Meta(
            pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
    };

    @override
    String toString(){
        return "$pagination, ";
    }
}

class Pagination {
    Pagination({
        required this.page,
        required this.pageSize,
        required this.pageCount,
        required this.total,
    });

    final int? page;
    final int? pageSize;
    final int? pageCount;
    final int? total;

    Pagination copyWith({
        int? page,
        int? pageSize,
        int? pageCount,
        int? total,
    }) {
        return Pagination(
            page: page ?? this.page,
            pageSize: pageSize ?? this.pageSize,
            pageCount: pageCount ?? this.pageCount,
            total: total ?? this.total,
        );
    }

    factory Pagination.fromJson(Map<String, dynamic> json){ 
        return Pagination(
            page: json["page"],
            pageSize: json["pageSize"],
            pageCount: json["pageCount"],
            total: json["total"],
        );
    }

    Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
    };

    @override
    String toString(){
        return "$page, $pageSize, $pageCount, $total, ";
    }
}
