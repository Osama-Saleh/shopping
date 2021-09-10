import 'package:flutter/material.dart';
import 'package:shopping/login/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  ///
  var boardingController = PageController();

  List<OnBoardingModel> boarding = [
    OnBoardingModel(
        image: "assets/image/shopping1.png", title: "title1", body: "body1"),
    OnBoardingModel(
        image: "assets/image/shopping2.png", title: "title2", body: "body2"),
    OnBoardingModel(
        image: "assets/image/shopping3.png", title: "title31", body: "body3"),
  ];

  bool islast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.indigoAccent,
                    ),
                  ),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Shopping",
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 40,
                    color: Colors.orangeAccent,
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: boardingController,
                  onPageChanged: (value) {
                    if (value == boarding.length - 1) {
                      setState(() {
                        islast = true;
                      });
                    } else
                      setState(() {
                        islast = false;
                      });
                  },
                  itemBuilder: (context, index) =>
                      pageViewBuildItems(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SmoothPageIndicator(
                controller: boardingController,
                count: boarding.length,
                effect: WormEffect(
                  spacing: 10.0,
                  dotWidth: 15.0,
                  dotHeight: 15.0,
                  dotColor: Colors.grey,
                  activeDotColor: Colors.indigo,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    ///controller هتحكم في ال بيح فيو  من خلال البوتون فهستخدم
                    onPressed: () {
                      if (islast) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      }
                      boardingController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInToLinear,
                      );
                    },
                    backgroundColor: Colors.indigo,
                    child: Icon(Icons.arrow_forward_outlined),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

Widget pageViewBuildItems(OnBoardingModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      Text(
        "${model.title}",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        "${model.body}",
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    ],
  );
}
