import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NeedsPage extends StatefulWidget {
  @override
  _NeedsPageState createState() => new _NeedsPageState();
}

class _NeedsPageState extends State<NeedsPage> {
  String _needsInput = "";

  void _updateInput(String input) {
    setState(() {
      _needsInput = input;
    });
  }

  void _continue() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var textStyle =
        GoogleFonts.spartan(fontSize: 24.0, fontStyle: FontStyle.normal);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: [
              Text(
                "I need",
                style: textStyle,
                textAlign: TextAlign.left,
              ),
            ]),
            Row(children: [
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'a miter saw',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                  ),
                  textCapitalization: TextCapitalization.none,
                  onChanged: _updateInput,
                  onSubmitted: (String val) => val != "" ? _continue() : null,
                  autofocus: true,
                  textInputAction: TextInputAction.go,
                  style: textStyle,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  enableSuggestions: false,
                ),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              IgnorePointer(
                ignoring: _needsInput == "",
                child: new Opacity(
                  opacity: _needsInput == "" ? 0 : 1,
                  child: new FlatButton(
                      onPressed: _continue,
                      child: Text(
                        "CONTINUE",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
    return null;
  }
}
