class User {
    User({
        required this.user,
    });

    final UserClass? user;

    User copyWith({
        UserClass? user,
    }) {
        return User(
            user: user ?? this.user,
        );
    }

    factory User.fromJson(Map<String, dynamic> json){ 
        return User(
            user: json["user"] == null ? null : UserClass.fromJson(json["user"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
    };

    @override
    String toString(){
        return "$user, ";
    }
}

class UserClass {
    UserClass({
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

    UserClass copyWith({
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
    }) {
        return UserClass(
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
        );
    }

    factory UserClass.fromJson(Map<String, dynamic> json){ 
        return UserClass(
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
    };

    @override
    String toString(){
        return "$id, $username, $email, $provider, $confirmed, $blocked, $createdAt, $updatedAt, $documentId, $publishedAt, ";
    }
}
