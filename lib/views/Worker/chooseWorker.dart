import 'package:flutter/material.dart';
import 'package:sound/views/System/sysCommon/sysCommonList.dart';
import 'package:sound/http/httpHandler.dart';
import 'package:sound/data/shared/sharedPreferencesData.dart';

class ChooseWorker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.indigo,
      ),
      home: ChooseWorkerBody(),
    );
  }
}

class ChooseWorkerBody extends StatefulWidget {
  ChooseWorkerBody({Key key}) : super(key: key);

  @override
  _ChooseWorkerBody createState() => _ChooseWorkerBody();
}

class _ChooseWorkerBody extends State<ChooseWorkerBody> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _key;
  String dropdownValue = 'One';

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

    final _keyInput = TextFormField(
      autofocus: false,
      onSaved: (String value) {
        this._key = value;
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
      validator: (value) => value.isEmpty ? '공란을 입력해주세요.' : null,
    );


    Widget _logo() {
      return new Hero(
        tag: 'logo1',
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 25.0,
            child: Image.asset('assets/logo/logo-black.png'),
          ),
        ),
      );
    }

    final _loginBtn = RaisedButton(
      color: Colors.black,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
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
            ' App Key 인1111증',
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ],
      ),
      onPressed: () {
        if (this._formKey.currentState.validate()) {
          _formKey.currentState.save();
          AppCertified(_key).then((result) {
            if (result == 0) {
              _showDialog('AppKey가 올바르지 않습니다.');
            } else {
              setPrefs();
              Navigator.pop(context);
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => SysCommonList()));
            }
          });
        }
      },
    );


    final _dropBox = DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
          color: Colors.deepPurple
        ),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
            setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['One', 'Two', 'Free', 'Four']
        .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        })
      .toList(),
    );


    Widget _bottomText() {
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

    return new Scaffold(
      body: new Center(
        child: new Form(
          key: this._formKey,
          child: new ListView(
            padding: EdgeInsets.only(top: 150.0, left: 24.0, right: 24.0),
            children: <Widget>[
              _logo(),
              SizedBox(height: 100.0),
              _dropBox,
              SizedBox(height: 50.0),
              _loginBtn,
              SizedBox(height: 50.0),
              _bottomText()
            ],
          ),
        ),
      ),
    );
  }
}
