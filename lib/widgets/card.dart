import 'package:flutter/material.dart';
import '/models/users.dart';

class CardWidget extends StatelessWidget {
  final User state;
  const CardWidget({Key? key, required this.state}) : super(key: key);

  Widget build(BuildContext context) {
    return Card(
      elevation: 16,
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gradient: LinearGradient(
            colors: [
              Colors.purple.shade400,
              Colors.pink.shade500,
              Colors.redAccent.shade400
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: NetworkImage(state.avatar),
                )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  state.username,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  state.firstname + " " + state.lastname,
                  style: TextStyle(fontSize: 16.0, color: Colors.white70),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  state.email,
                  style: TextStyle(fontSize: 14.0, color: Colors.white70),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  state.mobile,
                  style: TextStyle(fontSize: 14.0, color: Colors.white70),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  state.gender,
                  style: TextStyle(fontSize: 14.0, color: Colors.white70),
                ),
              ],
            )),
            Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {
                              print('Delete ID ${state.id}');
                            },
                            icon: Icon(
                              Icons.delete_outlined,
                            )),
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {
                              print('Edit ID ${state.id}');
                            },
                            icon: Icon(
                              Icons.edit_outlined,
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          state.id,
                          style:
                              TextStyle(fontSize: 35.0, color: Colors.white70),
                        ),
                        Text(
                          'ID',
                          style:
                              TextStyle(fontSize: 14.0, color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
