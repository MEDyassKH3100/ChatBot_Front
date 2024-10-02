class Attestation {
  String? id;
  String? studentId;
  String? type;
  DateTime? dateIssued;
  String? fullName;
  String? course;
  String? year;
  String? issuedBy;
  String? status;
  String? additionalDetails;
  String? pdfPath;

  Attestation({
    this.id,
    this.studentId,
    this.type,
    this.dateIssued,
    this.fullName,
    this.course,
    this.year,
    this.issuedBy,
    this.status,
    this.additionalDetails,
    this.pdfPath,
  });

Attestation.fromJson(Map<String, dynamic> json) {
    
      id =json['_id'] as String?;
      studentId=json['studentId'] as String?;
      type = json['type'] as String?;
      dateIssued= json['dateIssued'] != null
          ? DateTime.parse(json['dateIssued'])
          : null;
      fullName= json['fullName'] as String?;
      course= json['course'] as String?;
      year= json['year'] as String?;
      issuedBy= json['issuedBy'] as String?;
      status= json['status'] as String?;
      additionalDetails= json['additionalDetails'] as String?;
      pdfPath= json['pdfPath'] as String?;
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['studentId'] = studentId ;
    data['type'] = type ;
    data['fullName'] = fullName ;
    data['course'] = course ;
    data['year'] = year ;
    data['issuedBy'] = issuedBy  ;

    data['status'] = status ;
    data['additionalDetails'] = additionalDetails ;
    data['pdfPath'] = pdfPath ;

    
    return data;
  }
}

