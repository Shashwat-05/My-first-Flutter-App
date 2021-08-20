import 'package:flutter/material.dart';

class OUTPUT extends StatelessWidget {
  var outputvar;
  OUTPUT({Key? key, this.outputvar}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        color: Colors.amber.shade400,
        padding: EdgeInsets.all(30),
        width: 410,
        child: Text(
          "${this.outputvar}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      //SizedBox(
      //height: 200,
      //),
      Container(
          //alignment: Alignment.bottomCenter,
          //height: 100,
          color: Colors.amber.shade400,
          //child: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                side: BorderSide(width: 2, color: Colors.black)),
            child: const Text('Close'),
            onPressed: () => Navigator.pop(context),
          )),
      // ),
    ]);
  }
}
