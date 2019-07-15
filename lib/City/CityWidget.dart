import 'package:flutter/material.dart';

class CityWidget extends StatefulWidget {
  @override
  _CityWidgetState createState() => _CityWidgetState();
}

class _CityWidgetState extends State<CityWidget> {

  List<String> _hotCitys = new List();

  @override
  void initState() {
    super.initState();
    _hotCitys = [
      '北京',
      '上海',
      '广州',
      '深圳',
      '成都',
      '武汉',
      '杭州',
      '重庆',
      '郑州',
      '南京',
      '西安',
      '苏州',
      '长沙',
      '天津',
      '福州'
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          child: GestureDetector(
            child: Icon(Icons.arrow_back,color:Colors.green),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              child: TabBar(
                tabs: <Widget>[
                  Text('国内',style: TextStyle(color: Colors.green,fontSize: 18),),
                  Text('国外',style: TextStyle(color: Colors.green,fontSize: 18),),
                ],
              )
            ),
            Container(
              color: Colors.white70,
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '输入城市名查询',
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: Icon(Icons.search,color: Colors.green,),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                children: <Widget>[
                  Container(
                    color: Colors.grey[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 20,top: 8),child: Text('当前城市'),),
                        Container(
                          width: 120,
                          padding: EdgeInsets.only(left: 20,top: 8),
                          child: FlatButton(
                            color: Colors.white,
                            onPressed: (){},
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey[350]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.location_on),
                                Text('杭州'),
                              ],
                            ),
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20,top: 8),
                          child: Text('热门城市'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: 2.5,
                              ),
                              itemCount: _hotCitys.length,
                              itemBuilder: (context,index){
                                return MaterialButton(
                                  onPressed: (){
                                    Navigator.pop(context,_hotCitys[index]);
                                  },
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.grey[350]),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  color: Colors.white,
                                  elevation: 0,
                                  child: Text(_hotCitys[index]),
                                );
                              },
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                  Center(child: Text('Oversea'),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}