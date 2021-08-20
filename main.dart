import 'package:devapp/kubernetesfiles/k8s_menu.dart';
import 'package:devapp/live_stream_main.dart';
import 'package:devapp/terminal.dart';
import 'package:flutter/material.dart';
import 'package:devapp/dockerfiles/docker_menu.dart';
import 'package:devapp/dockerfiles/rm_image.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: main_menu(),
  ));
}

class main_menu extends StatefulWidget {
  const main_menu({Key? key}) : super(key: key);
  @override
  mainpage createState() => mainpage();
}

class mainpage extends State<main_menu> {
  var output_var; //this will hold and display the output

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade600,
        centerTitle: true,
        title: Text('Main Menu'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1628883058093-c6a36e3bba27?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8&auto=format&fit=crop&w=600&q=60'),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          Container(
                            child: Text(
                              "DevOps APP",
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          /*CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                'https://www.google.com/imgres?imgurl=https%3A%2F%2Fdytvr9ot2sszz.cloudfront.net%2Fwp-content%2Fuploads%2F2020%2F09%2Fkubernetes-wide.jpg&imgrefurl=https%3A%2F%2Flogz.io%2Fblog%2Fa-practical-guide-to-kubernetes-logging%2F&tbnid=YTHh36yluKuV4M&vet=12ahUKEwjZsZWGt7jyAhXooUsFHSF-A3gQMyghegUIARCPAg..i&docid=dkP9E-ipzUCvuM&w=745&h=272&q=kubernetes&ved=2ahUKEwjZsZWGt7jyAhXooUsFHSF-A3gQMyghegUIARCPAg'),
                          */
                          Container(
                            child: Text(
                              "SERVICES",
                              style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 280,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.pink.shade200,
                                  onPrimary: Colors.black),
                              child: Text(
                                'Docker',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => docker_Menu(),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 280,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.pink.shade200,
                                  onPrimary: Colors.black),
                              child: Text(
                                'Kubernetes',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => k8s_Menu(),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 280,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.pink.shade200,
                                  onPrimary: Colors.black),
                              child: Text(
                                'Linux Terminal',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => terminal(),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 280,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.pink.shade200,
                                  onPrimary: Colors.black),
                              child: Text(
                                'Live Streaming',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => live_stream(),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 280,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.pink.shade200,
                                  onPrimary: Colors.black),
                              child: Text(
                                'Ansible',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => rm_image(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )

                  //disable single line border below the text field
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
