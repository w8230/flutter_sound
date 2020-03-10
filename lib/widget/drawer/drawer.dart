import 'package:flutter/material.dart';
import 'package:sound/views/Certified/certified.dart';
import 'package:sound/views/System/sysCommon/sysCommonList.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.dashboard,
            text: '자재 관리',
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(builder: (context) => Certified()));
            },
          ),
          _createDrawerItem(
            icon: Icons.dashboard,
            text: '생산 관리',
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(builder: (context) => SysCommonList()));
            },
          ),
          _createDrawerItem(
            icon: Icons.dashboard,
            text: '품질 관리',
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(builder: (context) => SysCommonList()));
            },
          ),
          Divider(),
          _createDrawerItem(icon: Icons.laptop, text: '관리자'),
          Divider(),
          _createDrawerItem(icon: Icons.settings, text: '설정'),
          ListTile(
            title: Text('v1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
  // 서버 이미지 가져와서
  // 이미지 드로잉 -> 저장
  TextStyle _textStyle(){
    return new TextStyle(
        color: Colors.white,
        fontSize: 15.0,
        fontWeight: FontWeight.w700
    );
  }

  Widget _createHeader(){
    return new UserAccountsDrawerHeader(
      accountName: new Text('김재일' , style: _textStyle()),
      accountEmail: new Text("투비시스템 / 개발팀" , style: _textStyle()),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new ExactAssetImage('assets/logo/drawer_header.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      currentAccountPicture: CircleAvatar(
          backgroundImage: new ExactAssetImage('assets/logo/user.png')),
    );
  }

  Widget _createDrawerItem({IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon,size: 15,),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text,style: TextStyle(fontSize: 13),),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}