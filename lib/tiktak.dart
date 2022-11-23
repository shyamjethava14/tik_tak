import 'dart:math';

import 'package:flutter/material.dart';

class sun extends StatefulWidget {
  const sun({Key? key}) : super(key: key);

  @override
  State<sun> createState() => _sunState();
}

class _sunState extends State<sun> {
  String s1 = "X";
  String s2 = "O";
  String r = "Reset";
  String n = "Please Start The Game.👨‍💻👩‍💻";
  String U = "Undo", R = "Redo";
  List<String> l = List.filled(9, "");
  List temp = [];
  int t = 0, cnt = 0;
  bool winner = false;

  List<String> u_v_list = [];
  List<int> u_p_list = [];
  List<String> r_v_list = [];
  List<int> r_p_list = [];

  String lastvalue = "X";

  win() {
    //X condition
    if ((l[0] == s1 && l[1] == s1 && l[2] == s1) ||
        (l[3] == s1 && l[4] == s1 && l[5] == s1) ||
        (l[6] == s1 && l[7] == s1 && l[8] == s1) ||
        (l[0] == s1 && l[3] == s1 && l[6] == s1) ||
        (l[1] == s1 && l[4] == s1 && l[7] == s1) ||
        (l[2] == s1 && l[5] == s1 && l[8] == s1) ||
        (l[0] == s1 && l[4] == s1 && l[8] == s1) ||
        (l[2] == s1 && l[4] == s1 && l[6] == s1)) {
      n = "$s1 is Winner...👍";
      winner = true;
      if (winner == true) {}
    } else if ((l[0] == s2 && l[1] == s2 && l[2] == s2) ||
        (l[3] == s2 && l[4] == s2 && l[5] == s2) ||
        (l[6] == s2 && l[7] == s2 && l[8] == s2) ||
        (l[0] == s2 && l[3] == s2 && l[6] == s2) ||
        (l[1] == s2 && l[4] == s2 && l[7] == s2) ||
        (l[2] == s2 && l[5] == s2 && l[8] == s2) ||
        (l[0] == s2 && l[4] == s2 && l[8] == s2) ||
        (l[2] == s2 && l[4] == s2 && l[6] == s2)) {
      n = "$s2  is Winner...👍";
      winner = true;
    } else if (t == 5) {
      n = "Game is draw...🔴";
    }
  }

  abc() {
    if (t == 1) {
      n = "Game is running 🤹‍🤹‍‍";
    }
  }

  reset() {
    l = List.filled(9, "");
    temp.clear();
    cnt = 0;
    t = 0;
    u_p_list.clear();
    u_v_list.clear();
    r_v_list.clear();
    r_p_list.clear();
    if (t == 0) {
      n = "Please Start The Game.👨‍💻👩‍💻‍";
    }
    setState(() {});
    winner = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1d247b),
        title: Text(
          "Tick_Tack_Toe",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 2, right: 2, top: 2),
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    color: Color(0xFF1d247b),
                    child: Text("Player X is user.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18)
                        // style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    color: Color(0xFF1d247b),
                    child: Text("Player O is Robot.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 92,
            margin: EdgeInsets.only(left: 2, right: 2, top: 2),
            alignment: Alignment.center,
            color: Color(0xFF1d247b),
            child: Text(n,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20)),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(2),
              itemCount: l.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Color(0xFF1d247b),
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: (l[index] == "" && winner == false)
                        ? () {
                            setState(() {
                              if (l[index] == "") {
                                l[index] = s1;
                                temp.add(index);
                                u_v_list.add(s1);
                                cnt++;
                                print("cnt = ${cnt}");
                              }
                              if (cnt <= 4) {
                                while (true) {
                                  int random = Random().nextInt(9);
                                  print("random = ${random}");
                                  if (!temp.contains(random)) {
                                    l[random] = s2;
                                    u_v_list.add(s2);
                                    temp.add(random);
                                    break;
                                  }
                                }
                              }
                              u_p_list.add(index);
                              t++;
                              print("t = ${t}");
                              win();
                              abc();
                            });
                          }
                        : null,
                    child: Center(
                      child: Text(
                        "${l[index]}",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (u_p_list.length > 0) {
                      int lastpos = u_p_list.last;
                      String lastval = u_v_list.last;
                      l[lastpos] = "";
                      t--;
                      temp.removeLast();
                      u_p_list.removeLast();
                      u_v_list.removeLast();
                      r_v_list.add(lastval);
                      r_p_list.add(lastpos);
                      setState(() {});
                    } else {
                      print("Not Possible...");
                    }
                  },
                  child: Text(
                    U,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0))),
                      alignment: Alignment.center,
                      elevation: 15,
                      fixedSize: Size(116, 50),
                      primary: Color(0xFF1d247b),
                      onPrimary: Color(0xff5ebde5)),
                ),
                ElevatedButton(
                  onPressed: () {
                    reset();
                  },
                  child: Text(
                    r,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0))),
                      alignment: Alignment.center,
                      elevation: 15,
                      fixedSize: Size(117, 50),
                      primary: Color(0xFF1d247b),
                      onPrimary: Color(0xff5ebde5)),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (r_v_list.length > 0) {
                      int lastpos = r_p_list.last;
                      String lastval = r_v_list.last;
                      l[lastpos] = lastval;
                      t++;
                      r_p_list.removeLast();
                      r_v_list.removeLast();
                      u_p_list.add(lastpos);
                      u_v_list.add(lastval);
                      // print("${u_p_list}   ${u_v_list}" );
                      setState(() {});
                    }
                  },
                  child: Text(
                    R,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0))),
                      alignment: Alignment.center,
                      elevation: 15,
                      fixedSize: Size(116, 50),
                      primary: Color(0xFF1d247b),
                      onPrimary: Color(0xff5ebde5)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
