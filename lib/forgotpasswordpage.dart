import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFf5f5f5),
        toolbarHeight: 120,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              padding: const EdgeInsets.only(top: 8, left: 0.0),
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
              alignment: Alignment.topLeft,
            ),
            const SizedBox(height: 10),
            Text(
              'Reset your Password',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              'Enter your email address',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: const Color(0xFFf5f5f5),
        width: double.infinity,
        child: Column(
          children: [
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
            const Spacer(),
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
                  'Next',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
