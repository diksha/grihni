import 'package:flutter/material.dart';
import 'package:junkiri/ui/widgets/app_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              color: const Color(0xFFF2F2F4),
            ),
            Positioned(
              top: -60,
              left: -10,
              right: -10,
              child: Image.asset('assets/images/background001.png'),
            ),
            Positioned(
              top: 20,
              child: Container(
                color: Colors.transparent,
                width: width,
                child: appBar(context),
              ),
            ),
            Positioned(
              top: 100,
              left: 100,
              right: 100,
              child: Column(
                children: [
                  const Text(
                    "Hello, Proshish",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  Image.asset('assets/images/person.png'),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.transparent,
                height: height / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Image.asset('assets/images/training.png')),
                    const Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Text(
                        "Our Training Experts will contact you soon.",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
