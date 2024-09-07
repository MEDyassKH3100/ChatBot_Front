class User {
  String? nom;
  String? prenom;
  int? cin;
  String? identifiant;
  String? email;
  String? mdp;

  User(
      {this.nom,
      this.prenom,
      this.cin,
      this.identifiant,
      this.email,
      this.mdp});

  User.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    prenom = json['prenom'];
    cin = json['cin'];
    identifiant = json['identifiant'];
    email = json['email'];
    mdp = json['mdp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['cin'] = this.cin;
    data['identifiant'] = this.identifiant;
    data['email'] = this.email;
    data['mdp'] = this.mdp;
    return data;
  }
}