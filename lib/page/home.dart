// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> datas = [];
  late int _currentPageIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentPageIndex = 0;
    datas = [
      {
        "image": "assets/images/ara-1.jpg",
        "title": "암흑의 네메시스 축구화275",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-2.jpg",
        "title": "암흑의 LA갈비 5kg팔아요~",
        "location": "제주 제주시 아라동",
        "price": "100000",
        "likes": "5"
      },
      {
        "image": "assets/images/ara-3.jpg",
        "title": "암흑의 치약팝니다",
        "location": "제주 제주시 아라동",
        "price": "5000",
        "likes": "0"
      },
      {
        "image": "assets/images/ara-4.jpg",
        "title": "[풀박스]암흑의 맥북프로16인치 터치바 스페이스그레이",
        "location": "제주 제주시 아라동",
        "price": "2500000",
        "likes": "6"
      },
      {
        "image": "assets/images/ara-5.jpg",
        "title": "암흑의 디월트존기임팩",
        "location": "제주 제주시 아라동",
        "price": "150000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-6.jpg",
        "title": "암흑의 갤럭시s10",
        "location": "제주 제주시 아라동",
        "price": "180000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-7.jpg",
        "title": "암흑의 선반",
        "location": "제주 제주시 아라동",
        "price": "15000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-8.jpg",
        "title": "암흑의 냉장 쇼케이스",
        "location": "제주 제주시 아라동",
        "price": "80000",
        "likes": "3"
      },
      {
        "image": "assets/images/ara-9.jpg",
        "title": "암흑의 대우 미니냉장고",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "3"
      },
      {
        "image": "assets/images/ara-10.jpg",
        "title": "암흑의 멜킨스 풀업 턱걸이 판매합니다.",
        "location": "제주 제주시 아라동",
        "price": "50000",
        "likes": "7"
      },
    ];
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print('click');
        },
        child: Row(
          children: [
            Text(
              "암흑의 당근마켓",
              style: TextStyle(
                  // color: Colors.white,
                  ),
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
      elevation: 1,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svg/bell.svg", width: 22)),
      ],
      // backgroundColor: Colors.black,
    );
  }

  final oCcy = new NumberFormat("#,###", "ko_KR");

  String calcStringToWon(String priceString) {
    return "${oCcy.format(int.parse(priceString))}원";
  }

  Widget _bodyWidget() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (BuildContext _context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: Colors.black,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Image.asset(
                  datas[index]["image"]!,
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Container(
                    color: Colors.black,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            datas[index]["title"]!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          Text(
                            datas[index]["location"]!,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.5)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            calcStringToWon(datas[index]["price"]!),
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.red,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/heart_off.svg",
                                    width: 13,
                                    height: 13,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    datas[index]["likes"]!,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              )
            ],
          ),
        );
      },
      itemCount: datas.length,
      separatorBuilder: (BuildContext _context, int index) {
        return Container(height: 1, color: Colors.black.withOpacity(0.5));
      },
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: SvgPicture.asset(
            "assets/svg/${iconName}_off.svg",
            width: 22,
          ),
        ),
        label: label);
  }

  Widget _bottomNavigationBarwidget() {
    return BottomNavigationBar(
      backgroundColor: Colors.deepPurple[900],
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      selectedFontSize: 12,
      currentIndex: _currentPageIndex,
      items: [
        _bottomNavigationBarItem("home", '홈'),
        _bottomNavigationBarItem("notes", '암흑생활'),
        _bottomNavigationBarItem("location", '내 근처'),
        _bottomNavigationBarItem("chat", '채팅'),
        _bottomNavigationBarItem("user", '나의 암흑'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarwidget(),
      // bottomNavigationBar: Container(color: Colors.black),
    );
  }
}
