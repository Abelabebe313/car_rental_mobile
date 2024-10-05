import 'package:car_rental_app/features/Auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors/colors.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "title": "Find Your Vehicle",
      "text": "Find the perfect vehicle for every\n occasion!",
      "image": "assets/images/onbording-1.png"
    },
    {
      "title": "Your dream Car",
      "text": "Rent the car you’ve always\n wanted to drive.",
      "image": "assets/images/onbording-2.png"
    },
    {
      "title": "Your dream Car",
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/onbording-1.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    title: splashData[index]["title"],
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: const EdgeInsets.only(right: 5),
                            height: 6,
                            width: currentPage == index ? 20 : 6,
                            decoration: BoxDecoration(
                              color: currentPage == index
                                  ? const Color(0xFF03045E)
                                  : const Color(0xFFD8D8D8),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 3),
                      currentPage != 2
                          ? ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: const Color(0xFF03045E),
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 48),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                ),
                              ),
                              child: Text(
                                "Continue",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: ThemeColors.lightPrimary,
                                ),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SignInScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: const Color(0xFF03045E),
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 48),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                ),
                              ),
                              child: Text(
                                "Get Started",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: ThemeColors.lightPrimary,
                                ),
                              ),
                            ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashContent extends StatefulWidget {
  const SplashContent({
    Key? key,
    this.title,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image, title;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Image.asset(
          widget.image!,
          fit: BoxFit.contain,
          height: 265,
          width: 235,
        ),
        Text(
          widget.title!,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: ThemeColors.primary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          widget.text!,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w300,
            fontSize: 15,
            color: ThemeColors.primary.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
