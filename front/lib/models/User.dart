class User {
  String? nom;
  String? prenom;
  int? cin;
  String? identifiant;
  String? email;
  String? mdp;
  String? paymentReceipt;
  String? role;
  String? jwToken;
  bool? isBanned;
  bool? isVerified;

  User(
      {this.nom,
      this.prenom,
      this.cin,
      this.identifiant,
      this.email,
      this.mdp,
      this.paymentReceipt,
      this.role,
      this.jwToken,
      this.isBanned,
      this.isVerified,
      });

  User.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    prenom = json['prenom'];
    cin = json['cin'];
    identifiant = json['identifiant'];
    email = json['email'];
    mdp = json['mdp'];
    paymentReceipt = json ['paymentReceipt'];
    role = json['role'];
    jwToken = json['jwToken'];
    isBanned = json['isBanned'];
    isVerified = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['cin'] = this.cin;
    data['identifiant'] = this.identifiant;
    data['email'] = this.email;
    data['mdp'] = this.mdp;
    data['paymentReceipt'] = this.paymentReceipt;
    data['role'] = this.role;
    data['jwToken'] = this.jwToken;
    data['isBanned'] = this.isBanned;
    data['isVerified'] = this.isVerified;
    
    return data;
  }
}