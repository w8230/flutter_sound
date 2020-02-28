import 'package:flutter/material.dart';
import 'package:sound/views/System/sysCommon/sysCommonList.dart';

class Certified extends StatelessWidget {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void _showDialog(String msg) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('경고'),
            content: new Text(msg),
            actions: <Widget>[
              new FlatButton(
                child: new Text("닫기"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    final AppKey = TextFormField(
      autofocus: false,
      onSaved: (String value) {
      },
      decoration: InputDecoration(
        labelText: 'App Key를 입력하세요.',
        border: OutlineInputBorder(),
        icon: new Icon(
          Icons.vpn_key,
          size: 20,
          color: Colors.grey,
        ),
      ),
      validator: (value) => value.isEmpty ? 'App Key를 입력하세요.' : null,
    );


    Widget logo() {
      return new Hero(
        tag: 'logo1',
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 25.0,
            child: Image.asset('assets/logo/logo-sm.png'),
          ),
        ),
      );
    }

    final loginBtn = RaisedButton(
      color: Color.fromRGBO(33, 100, 176, 1),
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      splashColor: Colors.blueAccent,
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.lock_open,
            size: 13,
            color: Colors.white,
          ),
          Text(
            ' App Key 인증',
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ],
      ),
      onPressed: () {
        if (this._formKey.currentState.validate()) {
          _formKey.currentState.save();
          Navigator.pop(context);
          Navigator.push(context, new MaterialPageRoute(builder: (context) => SysCommonList()));
        }
      },
    );

    Widget bottomText() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'Copyright © 2020 TOBESYSTEM Corp. All Rights Reserved.',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 11.0,
          ),
        ),
      );
    }

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.indigo,
      ),
      home: new Scaffold(
        body: new Center(
          child: new Form(
            key: this._formKey,
            child: new ListView(
              padding: EdgeInsets.only(top: 150.0, left: 24.0, right: 24.0),
              children: <Widget>[
                logo(),
                SizedBox(height: 100.0),
                AppKey,
                SizedBox(height: 50.0),
                loginBtn,
                SizedBox(height: 50.0),
                bottomText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
