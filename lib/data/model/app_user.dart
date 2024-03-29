class AppUser {
  String? key;
  String email;
  String uid;

  AppUser(this.key, this.email, this.uid);

  AppUser.fromJson(Map<dynamic, dynamic> json)
      : key = json['key'] ?? "0",
        email = json['email'] ?? "email",
        uid = json['uid'] ?? "uid";

  toJson() {
    return {
      "email": email,
      "uid": uid,
    };
  }
}
