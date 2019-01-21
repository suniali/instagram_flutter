import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController(initialPage: 1);
  List<String> lst_name = [
    "Ali",
    "Mahdi",
    "Fateme",
    "Bahare",
    "Hasti",
    "Setare"
  ];
  int _currentIndext = 1;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[50],
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.camera_alt,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.live_tv),
            color: Colors.orangeAccent,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send),
            color: Colors.black87,
            onPressed: () {},
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndext = index;
          });
        },
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: 100,
                itemExtent: 100,
                itemBuilder: (context, index) => ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.asset(
                          "assets/images/6.jpg",
                          width: 40,
                          height: 40,
                        ),
                      ),
                      title: Text("Title"),
                      subtitle: Text("Show Video"),
                      trailing: const Icon(Icons.chevron_right),
                    ),
              )),
            ],
          ),
          ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Stories",
                          style: themeData.textTheme.title,
                        ),
                      ),
                      FlatButton.icon(
                        label:
                            Text("Watch All", style: themeData.textTheme.title),
                        icon: const Icon(Icons.play_arrow),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          6,
                          (index) => Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(children: <Widget>[
                                  Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 68.0,
                                        width: 68.0,
                                        child: Image.asset(
                                            "assets/images/story.png"),
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(120.0),
                                        child: Image.asset(
                                          "assets/images/${index + 1}.jpg",
                                          width: 48.0,
                                          height: 48.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(index < 6 ? lst_name[index] : null),
                                ]),
                              )),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    itemExtent: 450.0,
                    physics: ClampingScrollPhysics(),
                    children: List.generate(
                      100,
                      (index) => Container(
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    FlatButton.icon(
                                      icon: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          child: Image.asset(
                                            "assets/images/6.jpg",
                                            width: 40.0,
                                            height: 40.0,
                                            fit: BoxFit.cover,
                                          )),
                                      label: (Text("Title 1")),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.more_vert),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                Image.asset("assets/images/6.jpg"),
                              ],
                            ),
                          ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const Text("456"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabSelecte,
        currentIndex: _currentIndext,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            title: Text("Search"),
            icon: const Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: const Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Profile"),
            icon: const Icon(Icons.person),
          )
        ],
      ),
    );
  }

  void onTabSelecte(int index) {
    setState(() {
      _currentIndext = index;
    });
    pageController.animateToPage(index,
        curve: Curves.ease, duration: const Duration(milliseconds: 200));
  }
}
