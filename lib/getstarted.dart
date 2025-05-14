import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> features = [
      'Create tasks',
      'Set reminders',
      'Track progress',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Get started',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              const SizedBox(height: 5),

              // Features row with dot separators
              Row(
                children: List.generate(features.length * 2 - 1, (index) {
                  if (index.isEven) {
                    // Feature text
                    final feature = features[index ~/ 2];
                    return Text(
                      feature,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    );
                  } else {
                    // Dot separator
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '•',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }
                }),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                // child: Transform(
                //   alignment: Alignment.center,
                //   transform: Matrix4.identity()..scale(-1.0, 1.0),
                //   child: SvgPicture.asset(
                //     'illustration.svg',
                //     width: 400,
                //     height: 400,
                //   ), ),
                child: Image.asset('illustation.png', height: 400, width: 400),
              ),

              const Spacer(),

              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      debugPrint('Login pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      elevation: 0,
                      overlayColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),

                    child: const Text(
                      'Login',
                      style: TextStyle(color: Color(0xFFF9A825)),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Delete button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint('Signup pressed');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(450, 40),
                        backgroundColor: Color(0xFFF9A825),
                        elevation: 0,
                        overlayColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Signup',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
