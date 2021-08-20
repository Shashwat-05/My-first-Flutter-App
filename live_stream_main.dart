import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:devapp/output_screen.dart';

class live_stream extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<live_stream> {
  var output_var; //this will hold and display the output
  late String cont_name; //will carry container name
  late String img_name; // will carry img name

  create_container() async {
    var url = Uri.http("192.168.29.194", "/cgi-bin/flutter_docker_api.py",
        {"cont_name": cont_name, "img_name": img_name});
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
    //isScrollControlled: true);
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
            "Live Stream",
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://images.pexels.com/photos/2760856/pexels-photo-2760856.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 350,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Streaming Service",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
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
                        hintText: "IP of stream",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 260,
                  child: Center(
                    child: TextField(
                      onChanged: (value) {
                        img_name = value;
                      }, //onchanges to store the input text into variable
                      autocorrect: false,
                      textInputAction: TextInputAction.send,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                        prefixIcon: Icon(Icons.input_sharp),
                        hintText: "Port of stream",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink.shade200,
                      onPrimary: Colors.black,
                    ),
                    child: Text('Start'),
                    onPressed: create_container,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink.shade200,
                      onPrimary: Colors.black,
                    ),
                    child: Text('Join'),
                    onPressed: create_container,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
