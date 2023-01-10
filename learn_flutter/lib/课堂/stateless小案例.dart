import 'package:flutter/material.dart';

// ignore_for_file: avoid_print
void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homePage(),
    );
  }
}

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('列表'),
      ),
      body: homeContent(),
    );
  }
}

class homeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        homePrdocutItem('商品1', 'macbook',
            'https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg'),
        const SizedBox(
          height: 6,
        ),
        homePrdocutItem('商品2', 'macbook',
            'https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg'),
        const SizedBox(
          height: 6,
        ),
        homePrdocutItem('商品3', 'macbook',
            'https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg'),
        const SizedBox(
          height: 6,
        ),
        homePrdocutItem('商品4', 'macbook',
            'https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg'),
      ],
    );
  }
}

class homePrdocutItem extends StatelessWidget {
  final String title;
  final String dec;
  final String imageURL;
  // ignore: prefer_const_constructors
  final s1 = TextStyle(fontSize: 15, color: Colors.red);
  // ignore: prefer_const_constructors
  final s2 = TextStyle(fontSize: 30, color: Colors.blue);

  homePrdocutItem(this.title, this.dec, this.imageURL);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration:
          BoxDecoration(border: Border.all(width: 5, color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: s1,
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 20,
          ),
          Text(
            dec,
            style: s2,
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 20,
          ),
          Image.network(imageURL)
        ],
      ),
    );
  }
}
