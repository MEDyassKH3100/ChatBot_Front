class User {
  String? email;
  String? mdp;

  User({this.email, this.mdp});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    mdp = json['mdp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['mdp'] = this.mdp;
    return data;
  }
}
