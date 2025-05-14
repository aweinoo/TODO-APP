import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({super.key});

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
              'Verify you email',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              'Enter the 6-digit code sent to your email.',
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
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomField(),
                  CustomField(),
                  CustomField(),
                  CustomField(),
                  CustomField(),
                  CustomField(),
                ],
              ),
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
                  'Verify',
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

class CustomField extends StatelessWidget {
  const CustomField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: '.',
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          counterText: '',
        ),
        showCursor: true,
        cursorColor: const Color(0xFF206412),
      ),
    );
  }
}
