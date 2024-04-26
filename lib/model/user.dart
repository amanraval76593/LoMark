class AppUser {
  AppUser({
    required this.id,
    required this.image,
    required this.name,
    required this.phone,
    required this.email,
    required this.role,
  });
  late String id;
  late String image;
  late String name;
  late String phone;
  late String email;
  late Type role;

  AppUser.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    phone = json['phone'] ?? '';
    email = json['email'] ?? '';
    id = json['id'] ?? '';
    json['role'].toString() == Type.buyer.name ? Type.buyer : Type.seller;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['email'] = email;
    data['id'] = id;
    data['phone'] = phone;
    data['role'] = role.name;
    return data;
  }
}

enum Type { buyer, seller }
