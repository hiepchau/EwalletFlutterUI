import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Stack(alignment: Alignment.topCenter, children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.amber,
          ),
          Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.red,
                  ),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            crossAxisCount: 4),
                    children: [
                      Container(
                        color: Colors.green,
                      ),
                      Container(
                        color: Colors.purple,
                      ),
                      Container(
                        color: Colors.pink,
                      ),
                      Container(
                        color: Colors.orange,
                      ),
                      Container(
                        color: Colors.orange,
                      ),
                      Container(
                        color: Colors.pink,
                      ),
                      Container(
                        color: Colors.purple,
                      ),
                      Container(
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 50,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: 100,
                          color: Colors.green,
                        ),
                        Container(
                          width: 100,
                          color: Colors.purple,
                        ),
                        Container(
                          width: 100,
                          color: Colors.pink,
                        ),
                        Container(
                          width: 100,
                          color: Colors.orange,
                        ),
                        Container(
                          width: 100,
                          color: Colors.white,
                        ),
                        Container(
                          width: 100,
                          color: Colors.pink,
                        ),
                        Container(
                          width: 100,
                          color: Colors.purple,
                        ),
                        Container(
                          width: 100,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.orange,
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.pink,
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.brown,
                  ),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        crossAxisCount: 4),
                    children: [
                      Container(
                        color: Colors.green,
                      ),
                      Container(
                        color: Colors.purple,
                      ),
                      Container(
                        color: Colors.pink,
                      ),
                      Container(
                        color: Colors.orange,
                      ),
                      Container(
                        color: Colors.orange,
                      ),
                      Container(
                        color: Colors.pink,
                      ),
                      Container(
                        color: Colors.purple,
                      ),
                      Container(
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.white,
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
