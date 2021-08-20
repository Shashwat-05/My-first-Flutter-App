import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:devapp/output_screen.dart';

class rm_cont extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<rm_cont> {
  var output_var; //this will hold and display the output
  late String cont_name; //will carry container name

  remove_container() async {
    var url = Uri.http("192.168.29.194", "/cgi-bin/flutter_docker_api.py",
        {"remCont": cont_name});
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_sharp,
                size: 30,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          backgroundColor: Colors.cyan.shade600,
          centerTitle: true,
          title: Text(
            "DOCKER",
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/4666748/pexels-photo-4666748.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 350,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Remove Container",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 260,
                  child: Center(
                    child: TextField(
                      onChanged: (value) {
                        cont_name = value;
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                        prefixIcon: Icon(Icons.input_sharp),
                        hintText: "Container name",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.pink.shade200,
                          onPrimary: Colors.black),
                      child: Text('Remove'),
                      onPressed: remove_container),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
