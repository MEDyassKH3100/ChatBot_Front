import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageContent> {
  final List<Map<String, dynamic>> universityImages = [
    {
      "image": "assets/Esprit/img1.jpg",
      "description":
          "L'École supérieure privée d'ingénierie et de technologie ou ESPRIT est une école d'ingénieurs privée de Tunisie basée à l'Ariana et agréée par le ministère de l'Enseignement supérieur et de la Recherche scientifique."
    },
    {
      "image": "assets/Esprit/img2.jpg",
      "description": "Description de l'image 2"
    },
    {
      "image": "assets/Esprit/img3.jpg",
      "description": "Description de l'image 3"
    },
  ];

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
       
        Column(
          children: [
            SizedBox(height: 20), // Adjust the spacing as needed
            Image.asset('assets/Esprit/logo.png', height: 120), // Esprit logo
            SizedBox(height: 5), // Space between logos
            Image.asset('assets/Esprit/ChatEsprit.png',
                height: 120), // Chat Esprit logo
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              child: Text(
                "Bienvenu \nsur notre application \nESPRIT CHAT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  foreground: Paint()
                    ..shader = ui.Gradient.linear(
                      const Offset(0, 20),
                      const Offset(150, 20),
                      <Color>[
                        const Color.fromARGB(255, 213, 4, 249),
                        const Color.fromARGB(255, 19, 5, 65),
                      ],
                    ),
                ),
              ),
            ),
            Expanded(
              child: DraggableScrollableSheet(
                builder: (context, scrollController) {
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: universityImages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(123, 0, 0, 0).withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: Offset(3, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),

                              child:Column(
                                children: [
                               Image.asset(universityImages[index]['image'], fit: BoxFit.cover),
                              Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        universityImages[index]['description'],
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(255, 255, 255, 255),
                                        
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    initialChildSize: calculateChildSize(context),
                    minChildSize: calculateChildSize(context),
                    maxChildSize: 1.0,
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
  double calculateChildSize(BuildContext context) {
    // Example calculation; please adjust according to your actual header size
    double estimatedHeaderHeight = MediaQuery.of(context).size.height * 0.4; // Adjust this value as necessary
    return (MediaQuery.of(context).size.height - estimatedHeaderHeight) / MediaQuery.of(context).size.height;
  }

}