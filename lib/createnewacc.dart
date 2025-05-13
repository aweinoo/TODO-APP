import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create new account',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Color(0xFFf5f5f5),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Color(0xFFf5f5f5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Username',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 8,
                ),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                hintText: 'Eg loremEpsum',
                hintStyle: const TextStyle(
                  inherit: true,
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 32, 100, 18),
                  ),
                ),
              ),
              showCursor: true,
              cursorColor: const Color(0xFF206412),
            ),

            // Email
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 8,
                ),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                hintText: 'Eg loremepsum@yahoo.com',
                hintStyle: const TextStyle(
                  inherit: true,
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 32, 100, 18),
                  ),
                ),
              ),
              showCursor: true,
              cursorColor: const Color(0xFF206412),
            ),

            // Password
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 8,
                ),
                border: OutlineInputBorder(),
                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                hintText: '***********',
                hintStyle: const TextStyle(
                  inherit: true,
                  letterSpacing: 4,
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w100,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 32, 100, 18),
                  ),
                ),
              ),
              showCursor: true,
              cursorColor: const Color(0xFF206412),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF9A825),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 60),
            Text(
              textAlign: TextAlign.center,
              'OR LOGIN WITH: ',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Image.asset('facebook.png', height: 50, width: 50),
                const SizedBox(width: 20),
                Image.asset('apple.png', height: 90, width: 90),
                const SizedBox(width: 10),
                Image.asset('google.png', height: 70, width: 70),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.black54),
                ),
                const Text(
                  ' Login',
                  style: TextStyle(color: Color(0xFFF9a825)),
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
