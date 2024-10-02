import 'package:flutter/material.dart';
import 'package:front/models/Attestation.dart';
import 'package:front/services/apiServices.dart';

class ReclamationBody extends StatefulWidget {
  const ReclamationBody({Key? key}) : super(key: key);

  @override
  _ReclamationBodyState createState() => _ReclamationBodyState();
}

class _ReclamationBodyState extends State<ReclamationBody> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  ApiService apiService = ApiService();

  Future<void> _submitReclamation() async {
  Attestation newAttestation = Attestation(
    fullName: fullNameController.text,
    type: "Reclamation",
    course: courseController.text,
    year: yearController.text,
    additionalDetails: detailsController.text,
  );
  var result = await apiService.createAttestation(newAttestation);
  if (result != null) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Réclamation créée avec succès')));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Échec de la création de la réclamation')));
  }
}


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(labelText: 'Nom Complet'),
            ),
            TextField(
              controller: courseController,
              decoration: InputDecoration(labelText: 'Cours'),
            ),
            TextField(
              controller: yearController,
              decoration: InputDecoration(labelText: 'Année Académique'),
            ),
            TextField(
              controller: detailsController,
              decoration: InputDecoration(labelText: 'Détails Supplémentaires'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitReclamation,
              child: Text('Soumettre'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
