import 'package:flutter/material.dart';
import 'package:devapp/dockerfiles/docker_create.dart';
import 'package:devapp/output_screen.dart';
import 'package:devapp/dockerfiles/rm_image.dart';
import 'package:devapp/dockerfiles/rm_cont.dart';
import 'package:http/http.dart' as http;

class docker_Menu extends StatefulWidget {
  @override
  mainpage createState() => mainpage();
}

class mainpage extends State<docker_Menu> {
  var output_var; //this will hold and display the output

  show_container() async {
    var url = Uri.http("192.168.29.194", "/cgi-bin/flutter_docker_api.py",
        {"showCont": 'run'});
    var response = await http.get(url);
    setState(
      () {
        output_var = response.body; //stores the output
      },
    );
    outputfunc();
  }

  show_images() async {
    var url = Uri.http(
        "192.168.29.194", "/cgi-bin/flutter_docker_api.py", {"showImg": 'run'});
    var response = await http.get(url);
    setState(
      () {
        output_var = response.body; //stores the output
      },
    );
    outputfunc();
  }

  outputfunc() {
    showModalBottomSheet(
        context: context,
        builder: (context) => OUTPUT(
              outputvar: output_var,
            ),
        isScrollControlled: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade600,
        centerTitle: true,
        title: Text('Docker'),
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
                              'https://images.unsplash.com/photo-1592963219751-3800a144a41e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTV8fGNhcmdvJTIwc2hpcHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60'),
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
                              "DOCKER ",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
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
                                  color: Colors.white,
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
                                  'Show Containers',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: show_container),
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
                                  'Show Images',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: show_images),
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
                                'Create Container',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => docker_create(),
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
                                'Remove Container',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => rm_cont(),
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
                                'Remove Image',
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
