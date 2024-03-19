class User {
    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updateAt;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.createdAt,
        required this.updateAt,
    });

    User.fromJson(Map<String, dynamic> json) 
       : id =json["id"],
        name = json["name"],
        email = json["email"],
        emailVerifiedAt= json["email_verified_at"],
        createdAt= DateTime.parse(json["created_at"]),
        updateAt= DateTime.parse(json["updated_at"]) ; 
}