class User {
  String? id;
  String? nom;
  String? prenom;
  int? cin;
  String? identifiant;
  String? email;
  String? mdp;
  String? paymentReceipt;
  String? role;
  bool? isBanned;
  bool? isVerified;
  
  String? jwtToken;

  User({
      this.id,
      this.nom,
      this.prenom,
      this.cin,
      this.identifiant,
      this.email,
      this.mdp,
      this.paymentReceipt,
      this.role,
      this.isBanned,
      this.isVerified,
      
      this.jwtToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    nom = json['nom'] as String?;
    prenom = json['prenom'] as String?;
    cin = json['cin'] as int?;
    identifiant = json['identifiant'] as String?;
    email = json['email'] as String?;
    mdp = json['mdp'] as String?;
    paymentReceipt = json['paymentReceipt'] as String?;
    role = json['role'] as String?;
    isBanned = json['isBanned'] as bool?;
    isVerified = json['isVerified'] as bool?;
    
    jwtToken = json['jwtToken'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['nom'] = nom;
    data['prenom'] = prenom;
    data['cin'] = cin;
    data['identifiant'] = identifiant;
    data['email'] = email;
    data['mdp'] = mdp;
    data['paymentReceipt'] = paymentReceipt;
    data['role'] = role;
    data['isBanned'] = isBanned;
    data['isVerified'] = isVerified;
    
    data['jwtToken'] = jwtToken;
    return data;
  }
}
