import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('asset/img/home.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          bottom: false,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Flexible(
                  flex: 5,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
                const Flexible(
                  flex: 50,
                  child: _MainPart(),
                ),
                Flexible(
                  flex: 45,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MainPart extends StatelessWidget {
  const _MainPart();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'U&I',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'parisienne',
            fontSize: 80.0,
          ),
        ),
        const Column(
          children: [
            Text(
              '우리 처음 만난날',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'sunflower',
                fontSize: 30.0,
              ),
            ),
            Text(
              '2023.03.29',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'sunflower',
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        IconButton(
          iconSize: 60.0,
          onPressed: () {},
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        const Text(
          'D+1',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'sunflower',
              fontSize: 50.0,
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
