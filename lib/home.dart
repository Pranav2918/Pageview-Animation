import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Pageview Controller
  late PageController _pageViewController;

  @override
  void initState() {
    //Pageview Controller Initialization
    _pageViewController = PageController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double pagePosition =
        _pageViewController.hasClients ? _pageViewController.page ?? 0 : 0;
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: <Widget>[
          //You can set background here!
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 350 + pagePosition * 80,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0))),
                child: PageView(
                  controller: _pageViewController,
                  children: [
                    _renderWelcomeWidget(pagePosition),
                    _renderEnrollWidget(pagePosition)
                  ],
                ),
              )),
        ],
      ),
    );
  }

  //Welcome Widget
  Widget _renderWelcomeWidget(double pagePosition) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Hey there!",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const Expanded(child: SizedBox()),
          const Text(
              "Welcome to the world of Flutter animations! Dive into a captivating journey where your content comes alive through seamless and stunning animations. Explore, create, and experience the magic of Flutter's PageView animations, designed to captivate and engage. Let's embark on this exciting adventure together!",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const Expanded(child: SizedBox()),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(50 + pagePosition * 30, 40),
                  elevation: 5.0,
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white),
              child: const Text(
                "Get Started",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  //Enroll Widget
  Widget _renderEnrollWidget(double pagePosition) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Enroll Yourself!",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const Expanded(flex: 1, child: SizedBox()),
          const Text(
              "Whether you're looking to advance your career, explore new interests, or enhance your expertise...Enroll Now!",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const Expanded(flex: 1, child: SizedBox()),
          TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "FlutterDev@hotmail.com",
                hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300),
                contentPadding: const EdgeInsets.fromLTRB(16, 13, 13, 16),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                        const BorderSide(color: Colors.teal, width: 2.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                        const BorderSide(color: Colors.teal, width: 2.0)),
              ),
              onChanged: (value) {},
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
          const Expanded(child: SizedBox()),
          TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "******",
                hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300),
                contentPadding: const EdgeInsets.fromLTRB(16, 13, 13, 16),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                        const BorderSide(color: Colors.teal, width: 2.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                        const BorderSide(color: Colors.teal, width: 2.0)),
              ),
              onChanged: (value) {},
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
          const Expanded(child: SizedBox()),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(100 + pagePosition * 100, 40),
                  elevation: 5.0,
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white),
              child: const Text(
                "Enroll Me!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
