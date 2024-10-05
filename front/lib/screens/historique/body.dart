import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:front/models/Attestation.dart';
import 'package:front/services/apiServices.dart';
// Votre service API pour les requêtes

class HistoriqueBody extends StatefulWidget {
  @override
  _HistoriqueBodyState createState() => _HistoriqueBodyState();
}

class _HistoriqueBodyState extends State<HistoriqueBody> {
  List<Attestation> attestations = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAttestations();
  }

  void fetchAttestations() async {
    var apiService = ApiService();
    var atts = await apiService
        .getUserPDFs(); // Assurez-vous que cette fonction est bien définie dans ApiService
    if (mounted) {
      setState(() {
        attestations = atts ?? [];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: attestations.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(attestations[index].type != null
                      ? attestations[index].type.toString()
                      : 'Type inconnu'),
                  subtitle: Text('Émis le : ${attestations[index].dateIssued}'),
                  trailing: IconButton(
                      icon: Icon(Icons.download),
                      onPressed: () {
                        if (attestations[index].pdfPath != null) {
                          _downloadAndOpenPDF(attestations[index].pdfPath!);
                        } else {
                          // Gérer le cas où pdfPath est null, par exemple, afficher une alerte
                          print('Le chemin du PDF est nul.');
                        }
                      }),
                ),
              );
            },
          );
  }

  void _downloadAndOpenPDF(String url) async {
    try {
      var data = await http.get(Uri.parse(url));
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mydocument.pdf");

      await file.writeAsBytes(bytes, flush: true);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PDFScreen(file.path),
        ),
      );
    } catch (e) {
      print("Erreur lors du téléchargement ou de l'ouverture du PDF : $e");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Impossible de télécharger le fichier')));
    }
  }
}

class PDFScreen extends StatelessWidget {
  final String path;

  PDFScreen(this.path);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Document")),
      body: PDFView(
        filePath: path,
      ),
    );
  }
}
